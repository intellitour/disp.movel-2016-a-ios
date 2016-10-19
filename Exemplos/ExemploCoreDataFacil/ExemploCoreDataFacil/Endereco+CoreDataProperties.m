//
//  Endereco+CoreDataProperties.m
//  ExemploCoreDataFacil
//
//  Created by Pedro Henrique on 19/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "Endereco+CoreDataProperties.h"

@implementation Endereco (CoreDataProperties)

+ (NSFetchRequest<Endereco *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Endereco"];
}

@dynamic logradouro;
@dynamic complemento;
@dynamic cidade;
@dynamic cep;
@dynamic geo;

@end
