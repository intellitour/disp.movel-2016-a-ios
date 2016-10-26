//
//  ViewController.m
//  ExemploAula05
//
//  Created by Pedro Henrique on 19/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Produto+CoreDataClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self incluirProduto];
}

- (void) incluirProduto {
    AppDelegate *delegate = (AppDelegate *)
                        [[UIApplication sharedApplication] delegate];
    
    NSPersistentContainer *container = delegate.persistentContainer;
    NSManagedObjectContext *context = container.viewContext;
    
    Produto *produto = [NSEntityDescription insertNewObjectForEntityForName:@"Produto"
                                                     inManagedObjectContext:context];
    
    [produto setNome:@"Projetor"];
    [produto setPreco:899.99];
    [produto setMarca:@"EPSON"];
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    
    
    NSDate *data = [formatter dateFromString:@"20/02/2025"];
    [produto setValidade:data];
    
    NSError *erroCoreData;
    if (![context save:&erroCoreData]) {
        NSLog(@"Deu erro! %@", erroCoreData);
    }else {
        NSLog(@"Produto incluido com suesso!");
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //select * from Produto
    NSFetchRequest *fr = [NSFetchRequest
                            fetchRequestWithEntityName:@"Produto"];
    
    // where nome ILIKE 'projetor'
    // link do ❤️: http://nshipster.com/nspredicate/
    [fr setPredicate:
     [NSPredicate predicateWithFormat:@"nome ==[cd] %@", @"projetor"]];
    
    // order by validade ASC
    [fr setSortDescriptors:
  @[[NSSortDescriptor sortDescriptorWithKey:@"validade" ascending:YES]]];
    
    //isso é padrão, não precisa passar
//    [fr setResultType:NSManagedObjectResultType];
 
    AppDelegate *delegate = (AppDelegate *)
    [[UIApplication sharedApplication] delegate];
    
    NSPersistentContainer *container = delegate.persistentContainer;
    NSManagedObjectContext *context = container.viewContext;
    
    NSError *erroFetch;
    NSArray *resultado = [context executeFetchRequest:fr
                                                error:&erroFetch];
    if (!erroFetch) {
        NSLog(@"Resultado: %@", resultado);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
