//
//  Endereco+CoreDataProperties.h
//  ExemploCoreDataFacil
//
//  Created by Pedro Henrique on 19/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "Endereco+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Endereco (CoreDataProperties)

+ (NSFetchRequest<Endereco *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *logradouro;
@property (nullable, nonatomic, copy) NSString *complemento;
@property (nullable, nonatomic, copy) NSString *cidade;
@property (nullable, nonatomic, copy) NSString *cep;
@property (nullable, nonatomic, retain) Ponto *geo;

@end

NS_ASSUME_NONNULL_END
