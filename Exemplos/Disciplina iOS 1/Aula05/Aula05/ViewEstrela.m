//
//  ViewEstrela.m
//  Aula05
//
//  Created by Pedro Henrique on 31/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewEstrela.h"

@implementation ViewEstrela


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configurar];
    }
    return self;
}

- (void) configurar {
    [self setBackgroundColor:[UIColor whiteColor]];
}

- (CGPoint) pontoDoAngulo: (CGFloat) angulo comRaio: (CGFloat) raio eOffset: (CGPoint) offset {
    return CGPointMake(raio * cos(angulo) + offset.x, raio * sin(angulo) + offset.y);
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath new];
    
    CGFloat extrusao = 100;
    CGPoint center = CGPointMake(rect.size.width/2, rect.size.height/2);
    
    NSUInteger pontasNaEstrela = 5 + arc4random() % 10;
    
    CGFloat angulo = (CGFloat) -(M_PI/2);
    CGFloat incrementoAngulo = (CGFloat) (M_PI * 2 / pontasNaEstrela);
    CGFloat raio = rect.size.width/2;
    
    BOOL primeiraPonta = YES;
    
    for (NSUInteger i=0; i<pontasNaEstrela; i++) {
        CGPoint proximoPonto = [self pontoDoAngulo:angulo+incrementoAngulo comRaio:raio eOffset:center];
        CGPoint pontoIntermediario = [self pontoDoAngulo:(angulo+incrementoAngulo/2) comRaio:extrusao eOffset:center];
        
        if (primeiraPonta) {
            primeiraPonta = NO;
            CGPoint ponto = [self pontoDoAngulo:angulo comRaio:raio eOffset:center];
            [path moveToPoint:ponto];
        }
        
        [path addLineToPoint:pontoIntermediario];
        [path addLineToPoint:proximoPonto];
        
        angulo += incrementoAngulo;
    }
    
    [path closePath];
    
    UIColor *verdeDoFelipe = [UIColor colorWithRed:10.0/255.0
                                             green:200.0/255.0
                                              blue:10.0/255.0
                                             alpha:1];
    
    
    UIColor *outraCor = [UIColor magentaColor];
    
    [verdeDoFelipe setFill];
    [outraCor setStroke];
    [path setLineWidth:3];
    [path fill];
    [path stroke];

    
}



@end
