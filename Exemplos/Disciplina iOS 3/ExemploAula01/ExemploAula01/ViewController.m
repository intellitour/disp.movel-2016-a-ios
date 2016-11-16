//
//  ViewController.m
//  ExemploAula01
//
//  Created by Pedro Henrique on 09/11/16.
//  Copyright © 2016 Pedro Henrique. All rights reserved.
//

#import "ViewController.h"
@import MobileCoreServices;
@import Photos;


@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.imageView setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *tap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                            action:@selector(onEscolherFoto:)];
    
    [self.imageView addGestureRecognizer:tap];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onEscolherFoto:(id)sender {
    
    UIImagePickerController *picker = [UIImagePickerController new];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [picker setDelegate:self];
    
    
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *imagem = info[UIImagePickerControllerOriginalImage];

    [self.imageView setImage:imagem];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
