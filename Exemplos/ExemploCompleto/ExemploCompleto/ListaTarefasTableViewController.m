//
//  ListaTarefasTableViewController.m
//  ExemploCompleto
//
//  Created by Pedro Henrique on 12/12/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ListaTarefasTableViewController.h"
#import "AppDelegate.h"
#import "TaskDTO.h"
#import "TarefaCell.h"
#import "Tarefa+CoreDataClass.h"
#import <SCLAlertView-Objective-C/SCLAlertView.h>

@interface ListaTarefasTableViewController () <NSFetchedResultsControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating>

@property (strong, nonatomic) NSString *termoBusca;
@property (strong, nonatomic, readonly) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic, readonly) UISearchController *searchController;

@end

@implementation ListaTarefasTableViewController
@synthesize fetchedResultsController = _fetchedResultsController;
@synthesize searchController = _searchController;

- (NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController == nil) {
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        NSPersistentContainer *container  = delegate.persistentContainer;
        NSManagedObjectContext *context = container.viewContext;
        
        NSFetchRequest *fetchRequest = [Tarefa fetchRequest];
        [fetchRequest setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"titulo" ascending:YES]]];
        
        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                        managedObjectContext:context
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
        [_fetchedResultsController setDelegate:self];
    }
    return _fetchedResultsController;
}

- (UISearchController *)searchController {
    if (!_searchController) {
        _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
        [_searchController setDimsBackgroundDuringPresentation:NO];
        [_searchController setHidesNavigationBarDuringPresentation:NO];
        [_searchController setSearchResultsUpdater:self];
        [_searchController.searchBar setPlaceholder:@"Pesquisar Tarefas"];
        [_searchController.searchBar setDelegate:self];
        [_searchController.searchBar sizeToFit];
    }
    return _searchController;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerNib:[UINib nibWithNibName:@"TarefaCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:[TarefaCell reuseIdentifier]];
    
    UIBarButtonItem *btBusca = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                             target:self
                                                                             action:@selector(mostrarBusca:)];
    [self.navigationItem setRightBarButtonItem:btBusca];
}

- (void) executarFetch {
    NSError *erroCoreData;
    if (![self.fetchedResultsController performFetch:&erroCoreData]) {
        SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
        [alert setShowAnimationType:SCLAlertViewShowAnimationFadeIn];
        [alert setHideAnimationType:SCLAlertViewHideAnimationSlideOutToCenter];
        [alert showError:@"Erro!"
                subTitle:@"Ocorreu um erro ao recuperar tarefas sincronizadas."
        closeButtonTitle:@"OK"
                duration:0];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self executarFetch];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_fetchedResultsController.managedObjectContext save:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) mostrarBusca: (UIBarButtonItem *) sender {
    [self presentViewController:self.searchController animated:YES completion:nil];
}

#pragma mark - NSFetchedResultsControllerDelegate
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller
  didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex
     forChangeType:(NSFetchedResultsChangeType)type {
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationRight];
            break;
        case NSFetchedResultsChangeUpdate:
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationLeft];
            break;
        default:
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
            break;
        case NSFetchedResultsChangeUpdate:
            [self configurarCelula:[self.tableView cellForRowAtIndexPath:indexPath] comIndexPath:indexPath];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeMove:
            if (indexPath) {
                [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            }
            if (newIndexPath) {
                [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationRight];
            }
            break;
        default:
            break;
    }
}

- (void) configurarCelula: (__kindof UITableViewCell *) celula comIndexPath: (NSIndexPath *) indexPath {
    TarefaCell *cell = celula;
    Tarefa *t = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [cell configurarComTask:t];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.fetchedResultsController.sections.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.fetchedResultsController.sections objectAtIndex:section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TarefaCell *cell = [tableView dequeueReusableCellWithIdentifier:[TarefaCell reuseIdentifier] forIndexPath:indexPath];
    [self configurarCelula:cell comIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Tarefa *t = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [t setCompletada:!t.completada];
    [self configurarCelula:[tableView cellForRowAtIndexPath:indexPath] comIndexPath:indexPath];
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    [self executarBuscaComQuery:searchController.searchBar.text];
}

- (void) executarBuscaComQuery: (NSString *) query {
    if (query != nil && query.length > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"titulo BEGINSWITH[cd] %@", query];
        [self.fetchedResultsController.fetchRequest setPredicate:predicate];
    }else {
        [self.fetchedResultsController.fetchRequest setPredicate:nil];
    }
    [self executarFetch];
    [self.tableView reloadData];
}

#pragma mark - UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [self.tableView reloadData];
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    _termoBusca = nil;
    _fetchedResultsController = nil;
    [self executarFetch];
    [self.tableView reloadData];
}

@end
