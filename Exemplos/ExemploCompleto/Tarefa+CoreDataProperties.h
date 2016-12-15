//
//  Tarefa+CoreDataProperties.h
//  ExemploCompleto
//
//  Created by Pedro Henrique on 08/12/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "Tarefa+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Tarefa (CoreDataProperties)

+ (NSFetchRequest<Tarefa *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *titulo;
@property (nonatomic) BOOL completada;

@end

NS_ASSUME_NONNULL_END
