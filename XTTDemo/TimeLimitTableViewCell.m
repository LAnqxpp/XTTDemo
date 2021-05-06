//
//  TimeLimitTableViewCell.m
//  XTTDemo
//
//  Created by w on 2021/4/29.
//  Copyright © 2021 xtt. All rights reserved.
//

#import "TimeLimitTableViewCell.h"
#import "NSMutableAttributedString+ZM.h"
@implementation TimeLimitTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = [UIColor colorWithHexString:@"#F4F5F9"];

    self.selectClassLab.textColor = [UIColor colorWithHexString:@"#FF5B57"];
    self.rmbLab.textColor = [UIColor colorWithHexString:@"#FF5B57"];
    self.subTitleLab.textColor = [UIColor colorWithHexString:@"#8E8E92"];
 
    
    NSMutableAttributedString *attStr = [NSMutableAttributedString zm_initWithStr:@"￥600" customBlock:^(NSMutableAttributedString * att) {
        [att zm_color:[UIColor colorWithHexString:@"#FF5B57"]];
        [att zm_font:[UIFont systemFontOfSize:18]];
        [att zm_appendStr:@"起" block:^(NSMutableAttributedString * _Nonnull attStr, NSString * _Nonnull str) {
            [attStr zm_color:[UIColor colorWithHexString:@"#8E8E92"]];
            [attStr zm_font:[UIFont systemFontOfSize:12]];
        }];
        
    }];
    
    
    
    self.rmbLab.attributedText = attStr;
    
    // Initialization code
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
