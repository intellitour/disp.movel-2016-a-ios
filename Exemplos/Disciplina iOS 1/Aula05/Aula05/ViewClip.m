//
//  ViewClip.m
//  Aula05
//
//  Created by Pedro Henrique on 24/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewClip.h"

@implementation ViewClip

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


- (void)drawRect:(CGRect)rect {
    //
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *retangulo = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:10];
   
    [[UIColor lightGrayColor] setFill];
    [[UIColor blackColor] setStroke];
    [retangulo fill];
    [retangulo setLineWidth:4.0];
    [retangulo stroke];
    
    [retangulo addClip];
    
    [self desenharCirculo: context];
}

- (void) desenharCirculo: (CGContextRef) context {
    CGContextSaveGState(context);
    
    [[UIColor redColor] setFill];
    
    UIBezierPath *oval = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, 60, 60)];
    [oval fill];
    
    CGContextRestoreGState(context);
}

@end
