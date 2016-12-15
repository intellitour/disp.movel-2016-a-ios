//
//  TaskDTO.h
//  ExemploCompleto
//
//  Created by Pedro Henrique on 08/12/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface TaskDTO : JSONModel


@property (strong, nonatomic) NSNumber *objectId;
@property (strong, nonatomic) NSNumber *userId;
@property (strong, nonatomic) NSString *title;
@property (assign, nonatomic) BOOL completed;

@end
