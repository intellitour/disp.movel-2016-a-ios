//
//  SegundaViewController.m
//  DesafioAula02
//
//  Created by Pedro Henrique on 10/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "SegundaViewController.h"

@interface SegundaViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelValor;

@end

@implementation SegundaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *btVoltar =
        [[UIBarButtonItem alloc] initWithTitle:@"Voltar"
                                         style:UIBarButtonItemStylePlain
                                        target:self
                                        action:@selector(voltar:)];
    [self.navigationItem setLeftBarButtonItem:btVoltar];
    
}

- (void) voltar: (UIBarButtonItem *) sender {
    [self performSegueWithIdentifier:@"voltarParaPrimeira" sender:sender];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.labelValor setText:self.valor];
}

- (IBAction)onMudarTexto:(UIButton *)sender {
    self.valor = @"Novo Texto";
    [self.labelValor setText:self.valor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
