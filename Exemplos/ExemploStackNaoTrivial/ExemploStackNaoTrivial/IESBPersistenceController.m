//
//  IESBPersistenceController.m
//  ExemploStackNaoTrivial
//
//  Created by Pedro Henrique on 05/12/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "IESBPersistenceController.h"

@interface IESBPersistenceController ()

@property (strong, nonatomic, readwrite) NSManagedObjectContext *moc;
@property (strong, nonatomic) NSManagedObjectContext *privateMoc;

@end

@implementation IESBPersistenceController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self iniciarStackCoreData];
    }
    return self;
}

- (void) iniciarStackCoreData {
    if (self.moc) return;
    
    @autoreleasepool {
        NSURL *modelURL =
            [[NSBundle mainBundle] URLForResource:@"MeuBanco"
                                    withExtension:@"momd"];
        
        NSManagedObjectModel *mom =
            [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSAssert(mom, @"%@:%@ Modelo não encontrado!", [self class], NSStringFromSelector(_cmd));
        
        NSPersistentStoreCoordinator *psc =
            [[NSPersistentStoreCoordinator alloc]
                initWithManagedObjectModel:mom];
        NSAssert(psc, @"Falha ao iniciar coordinator");
        
        [self setMoc:
            [[NSManagedObjectContext alloc]
             initWithConcurrencyType:NSMainQueueConcurrencyType]];
        
        [self setPrivateMoc:
            [[NSManagedObjectContext alloc]
                initWithConcurrencyType:NSPrivateQueueConcurrencyType]];
        
        [self.moc setParentContext:self.privateMoc];
        
        
        NSMutableDictionary *options = [NSMutableDictionary dictionary];
        options[NSMigratePersistentStoresAutomaticallyOption] = @YES;
        options[NSInferMappingModelAutomaticallyOption] = @YES;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSURL *docsURL =
            [[fileManager URLsForDirectory:NSDocumentDirectory
                                 inDomains:NSUserDomainMask] lastObject];
        
        NSURL *storeURL =
            [docsURL URLByAppendingPathComponent:@"MeuBanco.sqlite"];
        
        NSError *erro;
        NSPersistentStore *store =
            [psc addPersistentStoreWithType:NSSQLiteStoreType
                              configuration:nil
                                        URL:storeURL
                                    options:options
                                      error:&erro];
        
        NSAssert(store, @"Erro ao criar arquivo do banco: %@", erro);
    }
}

- (void) salvar {
    if (![self.privateMoc hasChanges] && ![self.moc hasChanges]) return;
    
    [self.moc performBlockAndWait:^{
        NSError *erro;
        
        if ([self.moc save:&erro]) {
            [self.privateMoc performBlock:^{
                NSError *erroPrivate;
                
                if (![self.privateMoc save:&erroPrivate]) {
                    NSLog(@"Erro ao salvar contexto de background: %@", erroPrivate);
                }
            }];
        }else {
            NSLog(@"Erro ao salvar o contexto principal: %@", erro);
        }
    }];
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BancoSalvou"
                                                        object:nil
                                                      userInfo:@{@"banco":@"informacaoQualquer"}];
    
    
}







@end
