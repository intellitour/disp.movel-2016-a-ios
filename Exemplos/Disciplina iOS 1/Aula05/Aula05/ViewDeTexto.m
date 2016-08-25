//
//  ViewDeTexto.m
//  Aula05
//
//  Created by Pedro Henrique on 24/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewDeTexto.h"

@implementation ViewDeTexto


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
    NSMutableAttributedString *iesb =
    [[NSMutableAttributedString alloc] initWithString:@"IESB"];
    
    
    [iesb addAttribute:NSFontAttributeName
                 value:[UIFont fontWithName:@"Courier" size:20]
                 range:NSMakeRange(0, iesb.length)];
    
    [iesb addAttribute:NSForegroundColorAttributeName
                 value:[UIColor redColor]
                 range:NSMakeRange(0, 1)];
    
    [iesb drawAtPoint:CGPointMake(0, 0)];
    
}


@end
