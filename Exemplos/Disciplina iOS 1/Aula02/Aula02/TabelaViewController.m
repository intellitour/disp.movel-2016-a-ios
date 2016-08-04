//
//  TabelaViewController.m
//  Aula02
//
//  Created by Pedro Henrique on 03/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "TabelaViewController.h"

@interface TabelaViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tabela;

@property (strong, nonatomic) NSArray<NSString *> *nomes;

@end

@implementation TabelaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tabela setDataSource:self];
    
    
    self.nomes = @[@"Maicá", @"Wellington", @"Leão", @"Bruno"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    return self.nomes.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"xpto"
                                    forIndexPath:indexPath];
    
    if (indexPath.row % 2) {
        [cell setBackgroundColor:[UIColor blueColor]];
    }else {
        [cell setBackgroundColor:[UIColor purpleColor]];
    }
    
    NSString *nome = [self.nomes objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:nome];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    
    
    return cell;
    
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
