//
//  DesafioTela02ViewController.m
//  Aula02
//
//  Created by Pedro Henrique on 07/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "DesafioTela02ViewController.h"
#import "DesafioTela01ViewController.h"

@interface DesafioTela02ViewController ()

@end

@implementation DesafioTela02ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Nome"
                                                                message:@"Qual é o seu nome?"
                                                         preferredStyle:UIAlertControllerStyleAlert];
    
    [ac addTextFieldWithConfigurationHandler: nil];
    [ac addAction:[UIAlertAction actionWithTitle:@"OK"
                                          style:UIAlertActionStyleDefault
                                        handler:^(UIAlertAction * _Nonnull action) {
                                            UITextField *tf = [ac.textFields firstObject];
                                            if (tf) {
                                                NSString *nome = tf.text;
                                                [self performSegueWithIdentifier:@"trocaNomeSegue" sender:nome];
                                            }
                                        }]];
    
    [self presentViewController:ac animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"trocaNomeSegue"]) {
        DesafioTela01ViewController *destino = segue.destinationViewController;
        [destino setNome:sender];
    }
}


@end
