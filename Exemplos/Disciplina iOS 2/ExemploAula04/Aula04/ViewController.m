//
//  ViewController.m
//  Aula04
//
//  Created by Pedro Henrique on 05/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintBotao;
@property (weak, nonatomic) IBOutlet UIButton *botao;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [_constraintBotao setConstant:60];
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:3 animations:^{
        [weakSelf.view layoutIfNeeded];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
