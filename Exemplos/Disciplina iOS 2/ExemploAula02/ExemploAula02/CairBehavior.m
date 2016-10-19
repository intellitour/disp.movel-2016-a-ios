//
//  CairBehavior.m
//  ExemploAula02
//
//  Created by Pedro Henrique on 21/09/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "CairBehavior.h"

@interface CairBehavior ()

@property (strong, nonatomic, readonly) UIGravityBehavior *gravidade;
@property (strong, nonatomic, readonly) UICollisionBehavior *colisao;

@end

@implementation CairBehavior
@synthesize gravidade = _gravidade;
@synthesize colisao = _colisao;

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addChildBehavior:self.gravidade];
        [self addChildBehavior:self.colisao];
    }
    return self;
}

- (UIGravityBehavior *)gravidade {
    if (!_gravidade) {
        _gravidade = [[UIGravityBehavior alloc] init];
        [_gravidade setMagnitude:0.7];
    }
    return _gravidade;
}

- (UICollisionBehavior *)colisao {
    if (!_colisao) {
        _colisao = [UICollisionBehavior new];
        [_colisao setTranslatesReferenceBoundsIntoBoundary:YES];
    }
    return _colisao;
}

- (void) adicionarItem: (id<UIDynamicItem>) item {
    [self.gravidade addItem:item];
    [self.colisao addItem:item];
}

- (void) removerItem: (id<UIDynamicItem>) item {
    [self.gravidade removeItem:item];
    [self.colisao removeItem:item];
}

@end
