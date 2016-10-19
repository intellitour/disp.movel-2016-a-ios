//
//  ViewController.m
//  ExemploCoreDataFacil
//
//  Created by Pedro Henrique on 19/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Pessoa+CoreDataClass.h"
#import "Endereco+CoreDataClass.h"
#import "Ponto+CoreDataClass.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btVerDados;

@end

@implementation ViewController
static NSString * const kChaveBancoCarregado = @"bancoCarregado";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setPrompt:@"Exemplo de Insert"];
    [_btVerDados setHidden:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self primeiraCarga]; //exemplos de insert
    
}

- (void) primeiraCarga {
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSPersistentContainer *containerPersistencia = delegate.persistentContainer;
    NSManagedObjectContext *ctx = containerPersistencia.viewContext;
    
    BOOL bancoCarregado = [[NSUserDefaults standardUserDefaults] boolForKey:kChaveBancoCarregado];
    
    if (!bancoCarregado) {
        [self setTitle:@"Carregando banco..."];
        NSString *caminhoArquivoJSON = [[NSBundle mainBundle] pathForResource:@"users" ofType:@"json"];
        
        NSError *erroJSON;
        NSArray<NSDictionary *> *pessoas = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:caminhoArquivoJSON]
                                                                           options:kNilOptions
                                                                             error:&erroJSON];
        
        if (pessoas) {
            for (NSDictionary *p in pessoas) {
                Pessoa *pessoa = [NSEntityDescription insertNewObjectForEntityForName:@"Pessoa"
                                                               inManagedObjectContext:ctx];
                
                [pessoa setNome:p[@"name"]];
                [pessoa setLogin:p[@"username"]];
                [pessoa setEmail:p[@"email"]];
                [pessoa setTelefone:p[@"phone"]];
                [pessoa setSite:p[@"website"]];
                
                Endereco *end = [NSEntityDescription insertNewObjectForEntityForName:@"Endereco"
                                                              inManagedObjectContext:ctx];
                NSDictionary *address = p[@"address"];
                
                [end setLogradouro:address[@"street"]];
                [end setComplemento:address[@"suite"]];
                [end setCidade:address[@"city"]];
                [end setCep:address[@"zipcode"]];
                
                Ponto *ponto = [NSEntityDescription insertNewObjectForEntityForName:@"Ponto"
                                                             inManagedObjectContext:ctx];
                NSDictionary *geo = address[@"geo"];
                
                [ponto setLatitude:[geo[@"lat"] doubleValue]];
                [ponto setLongitude:[geo[@"lng"] doubleValue]];
                
                [end setGeo:ponto];
                [pessoa setEndereco:end];
            }
            NSError *erroCoreData;
            if (![ctx save:&erroCoreData]) {
                NSLog(@"Erro ao realizar carga inicial: %@", erroCoreData);
            }else {
                [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kChaveBancoCarregado];
                [self setTitle:@"Banco Carregado"];
                [_btVerDados setHidden:NO];
            }
        }else {
            NSLog(@"Erro ao converter JSON: %@", erroJSON);
        }
    }else {
        [self setTitle:@"Banco Carregado"];
        [_btVerDados setHidden:NO];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
