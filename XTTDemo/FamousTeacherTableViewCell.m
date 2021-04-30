//
//  FamousTeacherTableViewCell.m
//  XTTDemo
//
//  Created by w on 2021/4/29.
//  Copyright © 2021 xtt. All rights reserved.
//

#import "FamousTeacherTableViewCell.h"

@implementation FamousTeacherTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectClassLab.textColor = [UIColor colorWithHexString:@"#FF5B57"];
    self.subTitleLab.textColor =  [UIColor colorWithHexString:@"#8E8E92"];
    self.rmbLab.textColor =  [UIColor colorWithHexString:@"#FF5B57"];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
