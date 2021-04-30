//
//  FindCollectionViewCell.m
//  XTTDemo
//
//  Created by w on 2021/4/30.
//  Copyright © 2021 xtt. All rights reserved.
//

#import "FindCollectionViewCell.h"

@implementation FindCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.titleLab.backgroundColor = [UIColor colorWithHexString:@"#F4F5F9"];
    self.titleLab.textColor = [UIColor colorWithHexString:@"#4A5566"];
    // Initialization code
}

@end
