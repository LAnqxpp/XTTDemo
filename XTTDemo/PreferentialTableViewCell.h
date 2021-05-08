//
//  PreferentialTableViewCell.h
//  XTTDemo
//
//  Created by w on 2021/4/29.
//  Copyright © 2021 xtt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBKBaseModel.h"
#import "XBTHBaseTableViewCell.h"
#import "CJJTimer.h"
NS_ASSUME_NONNULL_BEGIN

@interface PreferentialTableViewCell : UITableViewCell<CJJTimerViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIImageView *leftImg;
@property (weak, nonatomic) IBOutlet UIButton *buyBtn;
@property (weak, nonatomic) IBOutlet UILabel *rmbLab;
@property (nonatomic, strong) CJJTimerView *timer;

@property (nonatomic ,strong) CJJTimerViewConfiguration *configuration;

-(void)setZhi:(NSInteger)zhi;
@end

NS_ASSUME_NONNULL_END
