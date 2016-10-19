//
//  MeuScrollViewController.m
//  Aula04
//
//  Created by Pedro Henrique on 05/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "MeuScrollViewController.h"

@interface MeuScrollViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation MeuScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    __weak typeof(self) weakSelf = self;
    
    dispatch_queue_t fila = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(fila, ^{
        NSURL *url = [NSURL URLWithString:@"https://s-media-cache-ak0.pinimg.com/originals/4f/c7/84/4fc7841e00ceda2bdc69f00271e4dae7.jpg"];
        NSData *bytes = [NSData dataWithContentsOfURL:url];
        
        UIImage *imagem = [UIImage imageWithData:bytes];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *iv = [[UIImageView alloc] initWithImage:imagem];
            [iv sizeToFit];
            [weakSelf.scrollView setContentSize:imagem.size];
            [weakSelf.scrollView addSubview:iv];
            
            [weakSelf setTitle:@"Norma Dean"];
        });
    });
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
