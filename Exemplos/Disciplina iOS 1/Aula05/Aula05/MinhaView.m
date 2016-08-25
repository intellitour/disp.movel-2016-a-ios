//
//  MinhaView.m
//  Aula05
//
//  Created by Pedro Henrique on 24/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "MinhaView.h"

@implementation MinhaView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configurar];
    }
    return self;
}

- (void) configurar {
    [self setBackgroundColor:[UIColor yellowColor]];
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath new];
    
    [path moveToPoint:CGPointMake(75, 10)];
    [path addLineToPoint:CGPointMake(160, 150)];
    [path addLineToPoint:CGPointMake(10, 150)];
    [path closePath];
    
 
    //10, 200, 10
    
    
    UIColor *verdeDoFelipe = [UIColor colorWithRed:10.0/255.0
                                             green:200.0/255.0
                                              blue:10.0/255.0
                                             alpha:1];
    
    
    UIColor *outraCor = [UIColor magentaColor];
    
    [verdeDoFelipe setFill];
    [outraCor setStroke];
    
    [path fill];
    [path stroke];
}


@end
