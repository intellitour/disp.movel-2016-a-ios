//
//  Pessoa+CoreDataProperties.h
//  ExemploAula05
//
//  Created by Pedro Henrique on 19/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "Pessoa+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Pessoa (CoreDataProperties)

+ (NSFetchRequest<Pessoa *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *nome;
@property (nullable, nonatomic, copy) NSDate *dataNascimento;
@property (nullable, nonatomic, copy) NSString *telefone;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, retain) NSSet<Produto *> *produtos;

@end

@interface Pessoa (CoreDataGeneratedAccessors)

- (void)addProdutosObject:(Produto *)value;
- (void)removeProdutosObject:(Produto *)value;
- (void)addProdutos:(NSSet<Produto *> *)values;
- (void)removeProdutos:(NSSet<Produto *> *)values;

@end

NS_ASSUME_NONNULL_END
