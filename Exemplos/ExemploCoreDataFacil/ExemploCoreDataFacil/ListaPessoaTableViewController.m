//
//  ListaPessoaTableViewController.m
//  ExemploCoreDataFacil
//
//  Created by Pedro Henrique on 19/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ListaPessoaTableViewController.h"
#import "Pessoa+CoreDataClass.h"
#import "AppDelegate.h"

@interface ListaPessoaTableViewController () <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation ListaPessoaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"NSFetchedResultsController"];
    [self.navigationItem setPrompt:@"Exemplo de Retrieve e Delete"];
    
    [self.navigationItem setRightBarButtonItem: self.editButtonItem];
}

- (NSFetchedResultsController *)fetchedResultsController {
    if (!_fetchedResultsController) {
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        NSPersistentContainer *persistentContainer = delegate.persistentContainer;
        
        NSFetchRequest *fetchRequest = [Pessoa fetchRequest];
        [fetchRequest setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"nome" ascending:YES]]];
        
        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                        managedObjectContext:persistentContainer.viewContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
        [_fetchedResultsController setDelegate:self];
    }
    return _fetchedResultsController;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSError *erro;
    if (![self.fetchedResultsController performFetch:&erro]) {
        NSLog(@"Erro ao recuperar pessoas: %@", erro);
    }else {
        [self.tableView reloadData];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.fetchedResultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.fetchedResultsController.sections objectAtIndex:section] numberOfObjects];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celulaPadrao"
                                                            forIndexPath:indexPath];
    [self configurarCelula:cell noIndexPath:indexPath];
    return cell;
}


- (void) configurarCelula: (UITableViewCell *) cell noIndexPath: (NSIndexPath *) indexPath {
    Pessoa *pessoa = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [cell.textLabel setText:pessoa.nome];
}

#pragma mark - UITableViewDelegate
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Pessoa *pessoa = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [self.fetchedResultsController.managedObjectContext deleteObject:pessoa];
        
        NSError *erroCoreData;
        if (![self.fetchedResultsController.managedObjectContext save:&erroCoreData]) {
            NSLog(@"Deu erro: %@", erroCoreData);
        }
    }
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
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
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
            if (newIndexPath) {
                [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            }
            break;
        case NSFetchedResultsChangeDelete:
            if (indexPath) {
                [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            }
            break;
        case NSFetchedResultsChangeUpdate:
            [self configurarCelula:[self.tableView cellForRowAtIndexPath:indexPath] noIndexPath:indexPath];
            break;
        case NSFetchedResultsChangeMove:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
            
        default:
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

@end
