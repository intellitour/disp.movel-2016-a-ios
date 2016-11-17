//
//  ViewController.m
//  ExemploAula02
//
//  Created by Pedro Henrique on 16/11/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionDataDelegate>

@property (strong, nonatomic) NSMutableData *bytesResposta;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _bytesResposta = [NSMutableData new];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSURLSessionConfiguration *sc =
            [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sc
                                                          delegate:self
                                                     delegateQueue:nil];
    
    NSURLSessionDataTask *task =
            [session dataTaskWithURL:
                [NSURL URLWithString:@"http://jsonplaceholder.typicode.com/posts"]];
    
    [task resume];
}


#pragma mark - NSURLSessionDelegate
- (void)URLSession:(NSURLSession *)session
          dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data {
    
    [_bytesResposta appendData:data];
}


- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
didCompleteWithError:(nullable NSError *)error{
    
    if (error) {
        NSLog(@"Erro de conexão: %@", error);
    }else {
        NSError *erroJSON;
        
        NSArray<NSDictionary *> *posts =
        [NSJSONSerialization JSONObjectWithData:_bytesResposta
                                        options:kNilOptions
                                          error:&erroJSON];
        
        if (erroJSON) {
            NSLog(@"JSON recebido é inválido: %@", erroJSON);
        }else {
            NSLog(@"Dados recebidos: %@", posts);
            
            for (NSDictionary *post in posts) {
                NSLog(@"Post: %@", [post objectForKey:@"title"]);
            }
            
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
