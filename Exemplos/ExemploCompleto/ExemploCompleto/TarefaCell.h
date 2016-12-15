//
//  TarefaCell.h
//  ExemploCompleto
//
//  Created by Pedro Henrique on 12/12/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Tarefa;

@interface TarefaCell : UITableViewCell

+ (NSString *) reuseIdentifier;

- (void) configurarComTask: (Tarefa *) task;

@end
