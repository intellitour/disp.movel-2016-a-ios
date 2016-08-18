//
//  ViewController.m
//  Aula04
//
//  Created by Pedro Henrique on 17/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //NSRange
//    NSString *x = @"O rato roeu a roupa do rei de Roma";
//    NSRange range = [x rangeOfString:@"rei"];
//    
//    NSArray *y = @[@"a", @"b", @"c"];
//    NSArray *yp = [y subarrayWithRange:NSMakeRange(1, 1)];
//    
//    
//    //Literais
//    NSArray *array = @[@"c", @"d", @"e"];
//    NSDictionary *dict = @{@"chave":@1, @"chave2":@2, @"chave3":@4};
//    NSString *string = @"uma string";
//    NSNumber *numero = @23456;
//    numero = @1.2345;
//    numero = @-3;
//    
//    
//    numero = @YES;
//    numero = @NO;
//    
//    
//    SEL umMetodo = @selector(description);
//    umMetodo = @selector(splitViewController:willChangeToDisplayMode:);
//    
//    
//    
//    
//    
//    //PLIST
//    
//    NSBundle *mb = [NSBundle mainBundle];
//    NSString *path = [mb pathForResource:@"exemplo" ofType:@"plist"];
//    
//    NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:path];
//    
//    //Se a raíz fosse um array
////    NSArray *plist2 = [NSArray arrayWithContentsOfFile:path];
//    
//    
//    [plist writeToFile:path atomically:YES];
//    
//    
//    NSString *pasta =
//        [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
//                                             NSUserDomainMask,
//                                             YES) firstObject];
//    
//    NSString *arquivo = [pasta stringByAppendingPathComponent:@"arquivo"];
//    arquivo = [arquivo stringByAppendingPathExtension:@"plist"];
//    
//    [@[@2,@3] writeToFile:arquivo atomically:YES];
//    
//    
//    [[NSFileManager defaultManager] createFileAtPath:arquivo contents:nil attributes:nil];
    
    
    
    
    
    
    
    
    
    
    
}
- (IBAction)onPinch:(UIPinchGestureRecognizer *)sender {
    abort();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
