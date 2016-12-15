//
//  AppDelegate.m
//  ExemploStackNaoTrivial
//
//  Created by Pedro Henrique on 05/12/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "AppDelegate.h"
#import "IESBPersistenceController.h"

@interface AppDelegate ()

@property (strong, readwrite, nonatomic) IESBPersistenceController *persistenceController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.persistenceController = [[IESBPersistenceController alloc] init];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    [self.persistenceController salvar];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self.persistenceController salvar];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    [self.persistenceController salvar];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self.persistenceController salvar];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    [self.persistenceController salvar];
}


@end
