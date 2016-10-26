//
//  Produto+CoreDataProperties.h
//  ExemploAula05
//
//  Created by Pedro Henrique on 19/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "Produto+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Produto (CoreDataProperties)

+ (NSFetchRequest<Produto *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *nome;
@property (nonatomic) float preco;
@property (nullable, nonatomic, copy) NSString *marca;
@property (nullable, nonatomic, copy) NSDate *validade;

@end

NS_ASSUME_NONNULL_END
