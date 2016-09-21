//
//  CairBehavior.h
//  ExemploDynamicAnimator
//
//  Created by Pedro Henrique on 10/06/15.
//  Copyright (c) 2015 IESB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CairBehavior : UIDynamicBehavior
- (void) adicionarItem: (id<UIDynamicItem>) item;
- (void) removerItem: (id<UIDynamicItem>) item;
@end
