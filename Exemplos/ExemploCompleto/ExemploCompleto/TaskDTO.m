//
//  TaskDTO.m
//  ExemploCompleto
//
//  Created by Pedro Henrique on 08/12/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "TaskDTO.h"

@implementation TaskDTO

+ (JSONKeyMapper *)keyMapper {
    NSDictionary *mapeamento = @{@"objectId":@"id",
                                 @"userId":@"userId",
                                 @"title":@"title",
                                 @"completed":@"completed"};
    
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:mapeamento];
}

@end
