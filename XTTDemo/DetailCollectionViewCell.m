//
//  DetailCollectionViewCell.m
//  XTTDemo
//
//  Created by w on 2021/4/30.
//  Copyright © 2021 xtt. All rights reserved.
//

#import "DetailCollectionViewCell.h"

@implementation DetailCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    [self.btn setTitle:@"老师\n我们" forState:UIControlStateNormal];
//    self.btn.titleLabel.numberOfLines = 2;
//    self.btn.titleLabel.font = [UIFont systemFontOfSize:10];
//    [self.btn setTitleColor:[UIColor colorWithHexString:@"#8E8E92"] forState:UIControlStateNormal];

    NSMutableAttributedString *attStr = [NSMutableAttributedString zm_initWithStr:@"教师\n" customBlock:^(NSMutableAttributedString * att) {
             [att zm_color:[UIColor colorWithHexString:@"#8E8E92"]];
             [att zm_font:[UIFont systemFontOfSize:9]];
             [att zm_appendStr:@"名字" block:^(NSMutableAttributedString * _Nonnull attStr, NSString * _Nonnull str) {
                 [attStr zm_color:[UIColor colorWithHexString:@"#8E8E92"]];
                 [attStr zm_font:[UIFont systemFontOfSize:11]];

             }];
             
         }];
         
       
         self.titleLab.attributedText = attStr;
       
    
    // Initialization code
}

@end
