//
//  ViewController.m
//  Aula05
//
//  Created by Pedro Henrique on 24/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController.h"
#import "MinhaView.h"
#import "ViewDeTexto.h"
#import "ViewDeImagem.h"
#import "ViewClip.h"
#import "ViewEstrela.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
//    MinhaView *mv = [[MinhaView alloc] initWithFrame:CGRectMake(20, 20, 250, 250)];
//    [self.view addSubview:mv];
//    
//    ViewDeTexto *vt = [[ViewDeTexto alloc] initWithFrame:CGRectMake(30, 30, 200, 200)];
//    [self.view addSubview:vt];
    
    
//    ViewDeImagem *vi = [[ViewDeImagem alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
//    [self.view addSubview:vi];
    
//    ViewClip *clip = [[ViewClip alloc] initWithFrame:CGRectMake(30, 30, 250, 250)];
//    [self.view addSubview:clip];
    
    
    ViewEstrela *estrela = [[ViewEstrela alloc] initWithFrame:self.view.frame];
    [self.view addSubview: estrela];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
