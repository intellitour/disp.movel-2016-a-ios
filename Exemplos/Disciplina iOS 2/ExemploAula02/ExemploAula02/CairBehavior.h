//
//  CairBehavior.h
//  ExemploAula02
//
//  Created by Pedro Henrique on 21/09/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CairBehavior : UIDynamicBehavior

- (void) adicionarItem: (id<UIDynamicItem>) item;
- (void) removerItem: (id<UIDynamicItem>) item;

@end
