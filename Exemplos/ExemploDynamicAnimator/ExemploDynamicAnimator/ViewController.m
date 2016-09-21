//
//  ViewController.m
//  ExemploDynamicAnimator
//
//  Created by Pedro Henrique on 10/06/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "ViewController.h"
#import "CairBehavior.h"

@interface ViewController () <UIDynamicAnimatorDelegate>
@property (weak, nonatomic) IBOutlet UIView *tabuleiro;

@property (strong, nonatomic, readonly) UIDynamicAnimator *animator;
@property (strong, nonatomic, readonly) CairBehavior *cairBehavior; //Nossa subclasse de UIDynamicBehavior

@property (strong, nonatomic) NSMutableArray *quadradinhos;

@end

@implementation ViewController
@synthesize animator = _animator;
@synthesize cairBehavior = _cairBehavior;

static const CGSize TAMANHO_DO_QUADRADO = { 40, 40 };

#pragma mark - Lazy Load das Propriedades

//Lazy load da propriedade (ela é readonly por conta disso!)
- (CairBehavior *)cairBehavior {
    if (!_cairBehavior) {
        _cairBehavior = [[CairBehavior alloc] init];
        [self.animator addBehavior:_cairBehavior];
    }
    return _cairBehavior;
}

//Lazy load da propriedade (ela é readonly por conta disso!)
- (UIDynamicAnimator *)animator {
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.tabuleiro];
        [_animator setDelegate:self];
    }
    return _animator;
}


#pragma mark - Ciclo de Vida

- (void)viewDidLoad {
    [super viewDidLoad];
    _quadradinhos = [NSMutableArray new];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions

- (IBAction)fazerCairQuadrado:(UIButton *)sender {
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = TAMANHO_DO_QUADRADO;
    
    
    int x = (arc4random()%(int)self.tabuleiro.bounds.size.width) / TAMANHO_DO_QUADRADO.width; //Cálculo para determinar onde o quadrado vai surgir
    frame.origin.x = x * TAMANHO_DO_QUADRADO.width;
    
    UIView *quadradinho = [[UIView alloc] initWithFrame:frame];
    [quadradinho setBackgroundColor:[self gerarCorAleatoria]];
    
    [self.tabuleiro addSubview:quadradinho];
    [self.cairBehavior adicionarItem:quadradinho];
    [self.quadradinhos addObject:quadradinho];
}

- (IBAction)fazerExplodir:(UIButton *)sender {
    if ([self.quadradinhos count]) {
        for (UIView *q in self.quadradinhos) {
            [self.cairBehavior removerItem:q];
        }
        [UIView animateWithDuration:2.0
                         animations:^{
                             for (UIView *q in self.quadradinhos) {
                                 int x = (arc4random()%(int)(self.tabuleiro.bounds.size.width*5)) - (int)self.tabuleiro.bounds.size.width*2;
                                 int y = self.tabuleiro.bounds.size.height;
                                 q.center = CGPointMake(x, -y);
                             }
                         }
                         completion:^(BOOL finished) {
                             [self.quadradinhos makeObjectsPerformSelector:@selector(removeFromSuperview)];
                         }];
    }
}

#pragma mark - Lógica

- (UIColor *)gerarCorAleatoria { //nem tanto
    switch (arc4random()%5) {
        case 0: return [UIColor greenColor];
        case 1: return [UIColor blueColor];
        case 2: return [UIColor orangeColor];
        case 3: return [UIColor redColor];
        case 4: return [UIColor purpleColor];
    }
    return [UIColor blackColor];
}


@end
