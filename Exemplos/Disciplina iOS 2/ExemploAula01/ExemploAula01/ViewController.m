//
//  ViewController.m
//  ExemploAula01
//
//  Created by Pedro Henrique on 14/09/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController.h"

typedef int (^BLOCO_QUE_RECEBE_DOIS_INT_RETORNA_INT) (int a, int b);

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *minhaLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    __weak typeof(self) weakSelf = self;
    
//    [UIView animateWithDuration:1 animations:^{
//        CGRect frame = weakSelf.minhaLabel.frame;
//        frame.origin = CGPointMake(30, 30);
//        
//        [weakSelf.minhaLabel setFrame:frame];
//    }];
    
//    UILabel *novaLabel = [[UILabel alloc] initWithFrame:_minhaLabel.frame];
//    [novaLabel setText:@"Palmeiras 2 x 0 Flamengo"];
//    [novaLabel setBackgroundColor:[UIColor magentaColor]];
//    [novaLabel setTextColor:[UIColor blackColor]];
//    [novaLabel sizeToFit];
//    [UIView transitionFromView:self.minhaLabel
//                        toView:novaLabel
//                      duration:5
//                       options:UIViewAnimationOptionTransitionFlipFromLeft
//                    completion:^(BOOL finished) {
//                        if (finished) {
//                            NSLog(@"Terminou!");
//                        }
//                    }];
    
//    [UIView animateWithDuration:2 animations:[self retornaUmBloco]];
    
    [UIView animateWithDuration:5 animations:^{
        [weakSelf.minhaLabel setTransform:CGAffineTransformMakeRotation(3*M_PI)];
    }];
    
}


- (void (^) (void)) retornaUmBloco {
    __weak typeof(self) weakSelf = self;
    void (^blocoMudaPosicao) (void) = ^{
        [weakSelf.minhaLabel setCenter:CGPointMake(50, 50)];
    };
    
    return blocoMudaPosicao;
}

- (void) executaBloco: (void (^)(void)) bloco {
    bloco();
}

- (void) fazerCalculos {
    
    BLOCO_QUE_RECEBE_DOIS_INT_RETORNA_INT blocoQueSoma = ^(int x, int y) {
        return x+y;
    };
}

- (void) somar: (int) a
           com: (int) b
   usandoBloco: (BLOCO_QUE_RECEBE_DOIS_INT_RETORNA_INT) bloco {
    
    bloco(a, b);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
