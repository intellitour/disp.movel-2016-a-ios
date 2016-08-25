//
//  ViewDeImagem.m
//  Aula05
//
//  Created by Pedro Henrique on 24/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewDeImagem.h"

@implementation ViewDeImagem

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
    UIImage *mario = [UIImage imageNamed:@"mario"];
    
    [mario drawInRect:rect];
}

@end
