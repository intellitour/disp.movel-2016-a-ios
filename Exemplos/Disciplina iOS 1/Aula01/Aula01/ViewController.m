//
//  ViewController.m
//  Aula01
//
//  Created by Pedro Henrique on 25/07/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController.h"
#import "Carta.h"

@interface ViewController ()
  //class extension
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Carta *minhaCarta = [Carta new];
    [minhaCarta setNaipe:@"Copas"];
    [minhaCarta metodoExemplo];
    
    NSString *naipe = minhaCarta.naipe;
    
    int valor = [Carta testeEstatico];
    
    Carta *outraCarta = [[Carta alloc] initWithNaipe:@"Espada"];
    
    Carta *maisUma = [[Carta alloc] initWithNaipe:@"Espada"
                                          andFace:@"X"];
    
    Carta *deNovo = [[Carta alloc] initWithNaipe:@"Copas"
                                         andFace:@"X"
                                       andNumero:2];
    
}
- (IBAction)onClickButton:(UIButton *)sender {
    
    Carta *c = [[Carta alloc] initWithNaipe:@"Copa"
                                    andFace:@"1"
                                  andNumero:7];
    

    [c imprimirCarta];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
