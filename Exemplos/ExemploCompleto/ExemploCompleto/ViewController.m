//
//  ViewController.m
//  ExemploCompleto
//
//  Created by Pedro Henrique on 08/12/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <SCLAlertView-Objective-C/SCLAlertView.h>
#import "Tarefa+CoreDataClass.h"
#import "AppDelegate.h"
#import "TaskDTO.h"

@interface ViewController ()

@end

@implementation ViewController

static NSString * const kChaveCargaBanco = @"ChaveCargaBanco";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self carregarBanco];
}


- (MBProgressHUD *) mostrarLoader {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [hud.label setText:@"Aguarde..."];
    [hud.detailsLabel setText:@"Verificando sincronização dos dados..."];
    [hud setMode:MBProgressHUDModeIndeterminate];
    [hud.backgroundView setStyle:MBProgressHUDBackgroundStyleBlur];
    [hud setMinShowTime:3];
    return hud;
}

- (void) carregarBanco {
    BOOL bancoCarregado = [[NSUserDefaults standardUserDefaults] boolForKey:kChaveCargaBanco];
    __block MBProgressHUD *hud = [self mostrarLoader];
    if (!bancoCarregado) {
        [hud.detailsLabel setText:@"Sincronizando com o repositório de tarefas"];
        
        AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager new];
        NSURL *url = [NSURL URLWithString:@"https://jsonplaceholder.typicode.com/todos"];
        __weak typeof(self) weakSelf = self;
        NSURLSessionDataTask *task = [sessionManager dataTaskWithRequest:[NSURLRequest requestWithURL:url]
                                                       completionHandler:^(NSURLResponse * _Nonnull response,
                                                                           id  _Nullable responseObject,
                                                                           NSError * _Nullable error) {
                                                           if (error) {
                                                               NSLog(@"Erro requisição:\n%@", error);
                                                               [weakSelf performSelectorOnMainThread:@selector(mostrarMensagemErro) withObject:nil waitUntilDone:YES];
                                                               [hud performSelectorOnMainThread:@selector(hideAnimated:) withObject:@YES waitUntilDone:YES];
                                                           }else {
                                                               NSError *erroJSON;
                                                               NSMutableArray<TaskDTO *> *tarefas = [NSMutableArray arrayWithCapacity:[responseObject count]];
                                                               for (NSDictionary *todo in responseObject) {
                                                                   TaskDTO *task = [[TaskDTO alloc] initWithDictionary:todo error:&erroJSON];
                                                                   if (!erroJSON) {
                                                                       [tarefas addObject:task];
                                                                   }
                                                               }
                                                               if (tarefas.count != [responseObject count]) {
                                                                   NSLog(@"Erro na conversão do JSON:\n%@", erroJSON);
                                                                   [weakSelf performSelectorOnMainThread:@selector(mostrarMensagemErro) withObject:nil waitUntilDone:YES];
                                                               }else {
                                                                   [weakSelf performSelectorOnMainThread:@selector(salvarTarefas:) withObject:tarefas waitUntilDone:YES];
                                                               }
                                                           }
                                                       }];
        [task resume];
    }else {
        [hud hideAnimated:YES];
        [self performSegueWithIdentifier:@"sincronizacaoCompletaSegue" sender:nil];
    }
}

- (void) salvarTarefas: (NSArray<TaskDTO *> *) tarefas {
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSPersistentContainer *persistenceContainer = delegate.persistentContainer;
    NSManagedObjectContext *context = persistenceContainer.viewContext;
    
    for (TaskDTO *task in tarefas) {
        Tarefa *t = [NSEntityDescription insertNewObjectForEntityForName:@"Tarefa"
                                                  inManagedObjectContext:context];
        [t setTitulo:task.title];
        [t setCompletada:task.completed];
    }
    NSError *erroCoreData;
    if ([context save:&erroCoreData]) {
        [[MBProgressHUD HUDForView:self.view] hideAnimated:YES];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kChaveCargaBanco];
        [self mostrarMensagemSucesso];
    }else {
        NSLog(@"Erro ao salvar tarefas: %@", erroCoreData);
        [self mostrarMensagemErro];
    }
}

- (void) mostrarMensagemErro {
    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
    [alert setShowAnimationType:SCLAlertViewShowAnimationFadeIn];
    [alert setHideAnimationType:SCLAlertViewHideAnimationSlideOutToCenter];
    [alert showError:@"Erro!"
            subTitle:@"Ocorreu um erro ao sincronizar. Verifique sua conexão com a internet e tente novamente."
    closeButtonTitle:@"OK"
            duration:0];
}

- (void) mostrarMensagemSucesso {
    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
    [alert setShowAnimationType:SCLAlertViewShowAnimationFadeIn];
    [alert setHideAnimationType:SCLAlertViewHideAnimationSlideOutToCenter];
    
    [alert alertIsDismissed:^{
        [self performSegueWithIdentifier:@"sincronizacaoCompletaSegue" sender:nil];
    }];
    
    [alert showSuccess:@"Sucesso!"
              subTitle:@"A sincronização ocorreu com sucesso! Vamos ver a lista de tarefas agora..."
      closeButtonTitle:@"OK"
              duration:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
