//
//  ViewController.m
//  Aula02
//
//  Created by Pedro Henrique on 03/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController.h"
#import "SegundoViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *minhaLabel;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.minhaLabel setText:@"IESB"];
    [self.minhaLabel setBackgroundColor:[UIColor redColor]];
    [self.minhaLabel setTextColor:[UIColor whiteColor]];
    
    
}
- (IBAction)onTap:(UIButton *)sender {
    NSString *txLabel = self.minhaLabel.text;
    NSString *txButton = sender.titleLabel.text;
    [self.minhaLabel setText:txButton];
    [sender setTitle:txLabel
            forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"mudaParaSegundaTela"]) {
        
        SegundoViewController *destino = segue.destinationViewController;
        
        [destino setValor:@"Turma A 2016"];
        
        
    }
    
}


- (IBAction) unwindParaPrimeiraTela: (UIStoryboardSegue *) segue {
    
    SegundoViewController *origem = segue.sourceViewController;
    
    NSLog(@"Valor: %@", origem.valor);
    
}

@end
