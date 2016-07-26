//
//  Carta.m
//  Aula01
//
//  Created by Pedro Henrique on 25/07/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "Carta.h"

@interface Carta ()

@property (nonatomic, assign) BOOL estaIgual;

@end

@implementation Carta

@synthesize naipe = _naipe;
@synthesize face;

- (instancetype)init {
    return [super init];
}

- (instancetype)initWithNaipe: (NSString *) naipe {
    self = [super init];
    if (self) {
        [self setNaipe:naipe];
    }
    return self;
}

- (instancetype)initWithNaipe: (NSString *) naipe
                      andFace: (NSString *) face {
    
    self = [super init];
    if (self) {
        [self setNaipe:naipe];
        [self setFace:face];
    }
    return self;
}

- (instancetype)initWithNaipe:(NSString *)naipe
                      andFace:(NSString *)face
                    andNumero: (int) numero {
    
    self = [super init];
    if (self) {
        [self setNaipe:naipe];
        [self setFace:face];
        [self setNumero:numero];
    }
    return self;
    
}

- (void) imprimirCarta {
    NSLog(@"Carta %@ com face %@ e número %d", [self naipe],
          self.face, _numero);
    
    
    
    /*
     
        private int teste;
        public int getTeste() {
            return teste;
        }
        public void setTeste(int teste) {
            this.teste = teste;
        }
     
        private void meuMetodo() {
            getTeste();
            this.teste;
        }
     
     */
}

- (NSString *)naipe {
    return @"Ouros";
}

- (void) metodoExemplo {
    NSLog(@"Meu naipe é: %@", _naipe);
}

+ (int) testeEstatico {
    return 2;
}

@end
