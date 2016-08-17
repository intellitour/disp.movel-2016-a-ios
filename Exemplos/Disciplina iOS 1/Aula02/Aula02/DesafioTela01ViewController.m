//
//  DesafioTela01ViewController.m
//  Aula02
//
//  Created by Pedro Henrique on 07/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "DesafioTela01ViewController.h"

@interface DesafioTela01ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelNome;

@end

@implementation DesafioTela01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (_nome) {
        [_labelNome setText:[NSString stringWithFormat:@"O meu nome é: %@", _nome]];
    }else {
        [_labelNome setText:@"O meu nome é: "];
    }
}

- (IBAction)unwindParaTrocarNome:(UIStoryboardSegue *)segue {
    NSLog(@"Segue: %@", segue);
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
