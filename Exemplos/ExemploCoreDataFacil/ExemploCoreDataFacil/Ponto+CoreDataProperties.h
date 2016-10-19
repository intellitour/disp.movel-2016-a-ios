//
//  Ponto+CoreDataProperties.h
//  ExemploCoreDataFacil
//
//  Created by Pedro Henrique on 19/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "Ponto+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Ponto (CoreDataProperties)

+ (NSFetchRequest<Ponto *> *)fetchRequest;

@property (nonatomic) double latitude;
@property (nonatomic) double longitude;

@end

NS_ASSUME_NONNULL_END
