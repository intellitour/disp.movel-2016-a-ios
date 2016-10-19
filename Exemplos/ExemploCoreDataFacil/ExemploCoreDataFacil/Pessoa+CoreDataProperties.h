//
//  Pessoa+CoreDataProperties.h
//  ExemploCoreDataFacil
//
//  Created by Pedro Henrique on 19/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "Pessoa+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Pessoa (CoreDataProperties)

+ (NSFetchRequest<Pessoa *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *nome;
@property (nullable, nonatomic, copy) NSString *login;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *telefone;
@property (nullable, nonatomic, copy) NSString *site;
@property (nullable, nonatomic, retain) Endereco *endereco;

@end

NS_ASSUME_NONNULL_END
