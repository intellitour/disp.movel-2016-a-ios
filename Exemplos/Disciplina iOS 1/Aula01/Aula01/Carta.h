//
//  Carta.h
//  Aula01
//
//  Created by Pedro Henrique on 25/07/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Carta : NSObject

@property (nonatomic, strong) NSString *naipe;

@property (nonatomic, strong) NSString *face;

@property (nonatomic, assign) int numero;

- (instancetype)initWithNaipe: (NSString *) naipe;

- (instancetype)initWithNaipe: (NSString *) naipe
                      andFace: (NSString *) face;

- (instancetype)initWithNaipe:(NSString *)naipe
                      andFace:(NSString *)face
                    andNumero: (int) numero;

- (void) metodoExemplo;

+ (int) testeEstatico;

- (void) imprimirCarta;

@end
