//
//  ViewController.m
//  ExemploLidarComTeclado
//
//  Created by Pedro Henrique on 23/11/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *campoLogin;
@property (weak, nonatomic) IBOutlet UITextField *campoSenha;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintBotaoAcessar;
@end

@implementation ViewController {
    CGFloat valorOriginalConstanteBotaoAcessar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    valorOriginalConstanteBotaoAcessar = _constraintBotaoAcessar.constant;
    
    [_campoLogin setDelegate:self];
    [_campoSenha setDelegate:self];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(tecladoApareceu:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(tecladoSumiu:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) tecladoApareceu: (NSNotification *) sender {
    NSDictionary* dicionarioDeInformacoesSobreTeclado = [sender userInfo];
    CGRect frameDoTeclado = [[dicionarioDeInformacoesSobreTeclado valueForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    [_constraintBotaoAcessar setConstant: (valorOriginalConstanteBotaoAcessar + frameDoTeclado.size.height)];
    
}

- (void) tecladoSumiu: (NSNotification *) sender {
    [_constraintBotaoAcessar setConstant:valorOriginalConstanteBotaoAcessar];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder]; //isso faz o teclado se esconder
    if (textField == _campoLogin) {
        [_campoSenha becomeFirstResponder]; //isso faz o teclado aparecer, com foco no campoSenha
    }
    if (textField == _campoSenha) {
        //Efetuar o login do usuário (mesma ação que você faria para o botão acessar)
    }
    return YES;
}


@end
