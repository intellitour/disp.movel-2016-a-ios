//
//  CairBehavior.m
//  ExemploDynamicAnimator
//
//  Created by Pedro Henrique on 10/06/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import "CairBehavior.h"

@interface CairBehavior ()
@property (strong, nonatomic, readonly) UIGravityBehavior *gravidade;
@property (strong, nonatomic, readonly) UICollisionBehavior *colisao;
@end

@implementation CairBehavior
@synthesize gravidade = _gravidade;
@synthesize colisao = _colisao;

//Override do inicializador padrão
- (instancetype)init {
    self = [super init];
    if (self) {
        [self addChildBehavior:self.gravidade];
        [self addChildBehavior:self.colisao];
    }
    return self;
}

//Lazy load da propriedade (ela é readonly por conta disso!)
- (UIGravityBehavior *)gravidade {
    if (!_gravidade) {
        _gravidade = [[UIGravityBehavior alloc] init];
        [_gravidade setMagnitude:0.7];
    }
    return _gravidade;
}

//Lazy load da propriedade (ela é readonly por conta disso!)
- (UICollisionBehavior *)colisao {
    if (!_colisao) {
        _colisao = [[UICollisionBehavior alloc] init];
        [_colisao setTranslatesReferenceBoundsIntoBoundary:YES]; //faz com que as "paredes" da view sirvam para a colisão
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
