//
//  ViewController.m
//  ExemploImagemJSON
//
//  Created by Pedro Henrique on 17/11/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    dispatch_queue_t fila = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(fila, ^{
        UIImage *img = [UIImage imageNamed:@"iesb"];
        NSData *bytes = UIImageJPEGRepresentation(img, 0); //veja o comentário desta função
        
        NSString *stringBase64 = [bytes base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        NSDictionary *json = @{@"titulo":@"fotoDoIesb", @"img":stringBase64};
        
        NSError *erroJSON;
        NSData *jsonBytes = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:&erroJSON];
        if (jsonBytes) {
            NSURLSession *session = [NSURLSession sharedSession];
            
            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"URLdeUploadAqui"]];
            
            NSURLSessionUploadTask *uploadTask =
                [session uploadTaskWithRequest:request
                                      fromData:jsonBytes
                             completionHandler:^(NSData * _Nullable data,
                                                 NSURLResponse * _Nullable response,
                                                 NSError * _Nullable error) {
                                 if (error) {
                                     NSLog(@"Erro na chamada de upload: %@", error);
                                 }else {
                                     if (data) {
                                         //Aqui você trata os dados retornados, se houver.
                                         NSLog(@"Resposta recebida com dados.");
                                     }else {
                                         if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                                             NSHTTPURLResponse *resp = (NSHTTPURLResponse *)response;
                                             NSLog(@"Resposta sem erro, com status: %ld", (long)resp.statusCode);
                                         }
                                     }
                                 }
            }];
            
            [uploadTask resume];
            
        }else {
            NSLog(@"Erro ao converter para JSON: %@", erroJSON);
        }
        
        
    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
