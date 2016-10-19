//
//  Ponto+CoreDataProperties.m
//  ExemploCoreDataFacil
//
//  Created by Pedro Henrique on 19/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "Ponto+CoreDataProperties.h"

@implementation Ponto (CoreDataProperties)

+ (NSFetchRequest<Ponto *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Ponto"];
}

@dynamic latitude;
@dynamic longitude;

@end
