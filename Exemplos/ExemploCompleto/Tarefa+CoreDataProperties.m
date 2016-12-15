//
//  Tarefa+CoreDataProperties.m
//  ExemploCompleto
//
//  Created by Pedro Henrique on 08/12/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "Tarefa+CoreDataProperties.h"

@implementation Tarefa (CoreDataProperties)

+ (NSFetchRequest<Tarefa *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Tarefa"];
}

@dynamic titulo;
@dynamic completada;

@end
