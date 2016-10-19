//
//  ViewController.m
//  ExemploAula02
//
//  Created by Pedro Henrique on 21/09/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController.h"
#import "CairBehavior.h"

@interface ViewController () <UIDynamicAnimatorDelegate>
@property (weak, nonatomic) IBOutlet UIView *tabuleiro;

@property (strong, nonatomic, readonly) UIDynamicAnimator *animator;
@property (strong, nonatomic, readonly) CairBehavior *cairBehavior;

@property (strong, nonatomic) NSMutableArray<UIView *> *quadradinhos;

@end

@implementation ViewController
@synthesize animator = _animator;
@synthesize cairBehavior = _cairBehavior;

static const CGSize kTamanhoQuadrado = {40,40};

- (void)viewDidLoad {
    [super viewDidLoad];
    _quadradinhos = [NSMutableArray new];
}

#pragma mark - Propriedades Lazy
- (UIDynamicAnimator *)animator {
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc]
                     initWithReferenceView:self.tabuleiro];
        
        [_animator setDelegate:self];
    }
    return _animator;
}

- (CairBehavior *)cairBehavior {
    if (!_cairBehavior) {
        _cairBehavior = [[CairBehavior alloc] init];
        [self.animator addBehavior:_cairBehavior];
    }
    return _cairBehavior;
}



#pragma mark - IBAction
- (IBAction)fazerCairQuadrado:(UIButton *)sender {
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = kTamanhoQuadrado;
    
    //Determinar a partir de onde o quadrado vai cair
    int x = (arc4random() % (int)self.tabuleiro.bounds.size.width);
    x = x / kTamanhoQuadrado.width;
    frame.origin.x = x * kTamanhoQuadrado.width;
    
    UIView *quadradinho = [[UIView alloc] initWithFrame:frame];
    [quadradinho setBackgroundColor:[self gerarCorAleatoria]];
    
    [self.tabuleiro addSubview:quadradinho];
    [self.cairBehavior adicionarItem:quadradinho];
    [self.quadradinhos addObject:quadradinho];
}

- (IBAction)fazerExplodir:(UIButton *)sender {
    if (self.quadradinhos.count) {
        
        for (UIView *q in self.quadradinhos) {
            [self.cairBehavior removerItem:q];
        }
        
        [UIView animateWithDuration:2
                         animations:^{
                             for (UIView *q in self.quadradinhos) {
                                 int x = (arc4random() % (int)(self.tabuleiro.bounds.size.width * 5));
                                 x -= self.tabuleiro.bounds.size.width * 2;
                                 
                                 int y = self.tabuleiro.bounds.size.height;
                                 
                                 q.center = CGPointMake(x, -y);
                                 
                             }
                         }
                         completion:^(BOOL finished) {
                             [self.quadradinhos makeObjectsPerformSelector:@selector(removeFromSuperview)];
                             [self.quadradinhos removeAllObjects];
                         }];
    }
}

- (UIColor *) gerarCorAleatoria {
    switch (arc4random() % 5) {
        case 0: return [UIColor redColor];
        case 1: return [UIColor cyanColor];
        case 2: return [UIColor magentaColor];
        case 3: return [UIColor yellowColor];
        case 4: return [UIColor greenColor];
    }
    return [UIColor blackColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
