//
//  ViewController.m
//  ExemploStackNaoTrivial
//
//  Created by Pedro Henrique on 05/12/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(algoMudouNoBanco:)
                                                 name:@"BancoSalvou"
                                               object:nil];
}


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:@"BancoSalvou"
                                                  object:nil];
    
    
}


- (void) algoMudouNoBanco: (NSNotification *) notificacao {
    NSDictionary *info = notificacao.userInfo;
    NSLog(@"Info: %@", info);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
