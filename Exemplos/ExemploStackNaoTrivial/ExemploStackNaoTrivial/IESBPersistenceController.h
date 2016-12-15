//
//  IESBPersistenceController.h
//  ExemploStackNaoTrivial
//
//  Created by Pedro Henrique on 05/12/16.
//  Copyright © 2016 IESB. All rights reserved.
//

@import CoreData;

@interface IESBPersistenceController : NSObject

@property (strong, readonly) NSManagedObjectContext *moc;

- (void) salvar;

@end
