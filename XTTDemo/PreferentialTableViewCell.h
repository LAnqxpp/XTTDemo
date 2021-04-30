//
//  PreferentialTableViewCell.h
//  XTTDemo
//
//  Created by w on 2021/4/29.
//  Copyright © 2021 xtt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBKBaseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface PreferentialTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIImageView *leftImg;
@property (weak, nonatomic) IBOutlet ZJJTimeCountDownLabel *countdownLab;
@property (weak, nonatomic) IBOutlet UIButton *buyBtn;
@property (weak, nonatomic) IBOutlet UILabel *rmbLab;

@end

NS_ASSUME_NONNULL_END
