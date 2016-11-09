//
//  ViewController.m
//  ExemploBibliotecaMidia
//
//  Created by Pedro Henrique on 09/11/16.
//  Copyright © 2016 Pedro Henrique. All rights reserved.
//

#import "ViewController.h"
@import MobileCoreServices; //Dependência para os dois abaixo
@import MediaPlayer; //Framework para trabalhar com audio e vídeo
@import Photos; //Framework para trabalhar com a biblioteca de fotos



@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self acessarBibliotecaMusical]; //Descrição de uso no arquivo Info.plist (chave NSAppleMusicUsageDescription)
    [self acessarBibliotecaDeFotos]; //Descrição de uso no arquivo Info.plist (chave NSPhotoLibraryUsageDescription)
}

- (void) acessarBibliotecaMusical {
    __weak typeof(self) weakSelf = self;
    [MPMediaLibrary requestAuthorization:^(MPMediaLibraryAuthorizationStatus status) {
        if (status == MPMediaLibraryAuthorizationStatusAuthorized) {
            [weakSelf acessoAutorizadoBibliotecaMusical];
        }else {
            NSString *erro;
            switch (status) {
                case MPMediaLibraryAuthorizationStatusRestricted:
                    erro = @"O acesso à biblioteca está restrito por políticas da empresa ou por controle parental.";
                    break;
                case MPMediaLibraryAuthorizationStatusDenied:
                    erro = @"O acesso foi negado pelo usuário.";
                    break;
                default:
                    erro = @"Erro desconhecido.";
                    break;
            }
            NSLog(@"Erro ao acessar a biblioteca: %@", erro);
        }
    }];
}

- (void) acessoAutorizadoBibliotecaMusical {
    MPMediaQuery *query = [MPMediaQuery songsQuery]; //veja no header as opções
    if (query.items) {
        for (MPMediaItem *musica in query.items) {
            NSLog(@"Álbum: %@\tMúsica: %@", musica.albumTitle, musica.title);
        }
    }
}

- (void) acessarBibliotecaDeFotos {
    PHFetchResult<PHAssetCollection *> *result = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum
                                                                                          subtype:PHAssetCollectionSubtypeAny
                                                                                          options:nil];
    
    PHFetchOptions *options = [PHFetchOptions new];
    [options setPredicate:[NSPredicate predicateWithFormat:@"mediaType = %d", PHAssetMediaTypeImage]]; //Veja as opções no header
    
    
    //Ver também: https://developer.apple.com/reference/photos/phcachingimagemanager
    PHImageManager *manager = [PHImageManager defaultManager];
    
    PHImageRequestOptions *requestOptions = [PHImageRequestOptions new];
    [requestOptions setSynchronous:YES];
    [requestOptions setDeliveryMode:PHImageRequestOptionsDeliveryModeHighQualityFormat];
    [requestOptions setResizeMode:PHImageRequestOptionsResizeModeFast];
    
    for (PHAssetCollection *album in result) {
        PHFetchResult<PHAsset *> *fotos = [PHAsset fetchAssetsInAssetCollection:album
                                                                        options:options];
        
        for (PHAsset *foto in fotos) {
            [manager requestImageForAsset:foto
                               targetSize:CGSizeMake(1280, 720)
                              contentMode:PHImageContentModeAspectFit
                                  options:requestOptions
                            resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
                                /* Aqui vem o objeto UIImage que representa a foto em questão,
                                   cropando, na medida do possível, para o targetSize.
                                 
                                    Ver a configuração do objeto requestOptions e dos parâmetros
                                    desta chamada.
                                 */
                                
                                NSLog(@"Foto: %@", info);
                            }];
        }
    }
}

#pragma mark - IBActions

- (IBAction)onTirarFoto:(UIButton *)sender { //Vamos permitir foto e vídeo da câmera
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker = [UIImagePickerController new];
        [picker setDelegate:self];
        [picker setAllowsEditing:YES];
        [picker setShowsCameraControls:YES];
        [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
        [picker setMediaTypes:@[((NSString *) kUTTypeImage), ((NSString *) kUTTypeMovie)]]; //Veja as outras opções.
        
        [self presentViewController:picker animated:YES completion:nil];
        
    }else {
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Use um iPhone"
                                                                    message:@"É necessário um dispositivo físico que possua câmera."
                                                             preferredStyle:UIAlertControllerStyleAlert];
        
        [ac addAction:[UIAlertAction actionWithTitle:@"OK"
                                              style:UIAlertActionStyleCancel
                                             handler:nil]];
        
        [self presentViewController:ac animated:YES completion:nil];
    }
}

- (IBAction)onEscolherFoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [UIImagePickerController new];
    [picker setDelegate:self];
    [picker setAllowsEditing:YES];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    //Todos os tipos disponíveis:
    [picker setMediaTypes:[UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary]];
    
    [self presentViewController:picker animated:YES completion:nil];
}


#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *imagemEscolhida = info[UIImagePickerControllerEditedImage]; //Veja as outras opções.
    
    //Você vai precisar disso para o exercício
    NSData *bytesDaImagem = UIImagePNGRepresentation(imagemEscolhida);
    
    //Para converter de volta
    UIImage *imagem = [UIImage imageWithData:bytesDaImagem];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    NSLog(@"Usuário cancelou.");
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
