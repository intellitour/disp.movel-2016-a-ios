//
//  TarefaCell.m
//  ExemploCompleto
//
//  Created by Pedro Henrique on 12/12/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "TarefaCell.h"
#import "Tarefa+CoreDataClass.h"
#import <FontAwesomeKit/FontAwesomeKit.h>

@interface TarefaCell ()

@property (weak, nonatomic) IBOutlet UILabel *labelIcone;
@property (weak, nonatomic) IBOutlet UILabel *labelConteudo;


@end

@implementation TarefaCell

static NSString * const kReuseIdentifier = @"TarefaCell";


+ (NSString *) reuseIdentifier {
    return kReuseIdentifier;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void) configurarComTask: (Tarefa *) task {
    [_labelConteudo setText:task.titulo];
    if (task.completada) {
        FAKFontAwesome *icCompletado = [FAKFontAwesome checkSquareOIconWithSize:48];
        [_labelIcone setAttributedText:icCompletado.attributedString];
    }else {
        FAKFontAwesome *icPendente = [FAKFontAwesome squareOIconWithSize:48];
        [_labelIcone setAttributedText:icPendente.attributedString];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
