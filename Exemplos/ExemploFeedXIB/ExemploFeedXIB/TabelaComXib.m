//
//  TabelaComXib.m
//  ExemploFeedXIB
//
//  Created by Pedro Henrique on 26/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "TabelaComXib.h"
#import "CelulaExemploComXib.h"

@interface TabelaComXib ()

@end

@implementation TabelaComXib

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"CelulaExemploComXib" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"CelulaExemploComXib"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CelulaExemploComXib *cell = [tableView dequeueReusableCellWithIdentifier:@"CelulaExemploComXib" forIndexPath:indexPath];
    //chamar um método para alimentar a célula
    //Exemplo: [cell alimentarComTexto:@"xpto"];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100; //retornar aqui a altura estimada da célula... olhe no XIB a altura.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension; //isso faz a tableView aceitar células com alturas dinâmicas
}

@end
