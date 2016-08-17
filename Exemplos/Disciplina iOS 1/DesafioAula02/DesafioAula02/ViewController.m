//
//  ViewController.m
//  DesafioAula02
//
//  Created by Pedro Henrique on 10/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController.h"
#import "SegundaViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelTExto;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) unwindDaSegundaParaPrimeira: (UIStoryboardSegue *) segue {
    SegundaViewController *origem = segue.sourceViewController;
    [self.labelTExto setText:origem.valor];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"primeiraParaSegundaSegue"]) {
        NSString *valor = self.labelTExto.text;
        SegundaViewController *destino = segue.destinationViewController;
        [destino setValor:valor];
    }
}

@end
