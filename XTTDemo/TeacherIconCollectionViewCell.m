//
//  TeacherIconCollectionViewCell.m
//  XTTDemo
//
//  Created by w on 2021/4/30.
//  Copyright © 2021 xtt. All rights reserved.
//

#import "TeacherIconCollectionViewCell.h"

@implementation TeacherIconCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.teaIconImg.layer.masksToBounds = YES;
    self.teaIconImg.layer.cornerRadius = 15;
    // Initialization code
}

@end
