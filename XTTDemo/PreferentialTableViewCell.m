//
//  PreferentialTableViewCell.m
//  XTTDemo
//
//  Created by w on 2021/4/29.
//  Copyright © 2021 xtt. All rights reserved.
//

#import "PreferentialTableViewCell.h"

@implementation PreferentialTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = [UIColor colorWithHexString:@"#F4F5F9"];

    
    
//    [self setupTimeLabelP];
    [self.contentView addSubview:self.timer];
    [self.timer configureLayout:^(CGFloat timerWidth, CGFloat timerHeight) {
        [self.timer mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleLab.mas_left);
            make.top.mas_equalTo(self.titleLab.mas_bottom).offset(10);
            make.size.mas_equalTo(CGSizeMake(timerWidth, timerHeight));
        }];
    }];
    
    self.buyBtn.backgroundColor = [UIColor colorWithHexString:@"#FF5B57"];
    [self.buyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.buyBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    self.buyBtn.layer.cornerRadius = 5;
    self.buyBtn.layer.masksToBounds = YES;
    
    
      NSMutableAttributedString *attStr = [NSMutableAttributedString zm_initWithStr:@"￥9.0 " customBlock:^(NSMutableAttributedString * att) {
          [att zm_color:[UIColor colorWithHexString:@"#FF5B57"]];
          [att zm_font:[UIFont systemFontOfSize:16]];
          [att zm_appendStr:@"￥200" block:^(NSMutableAttributedString * _Nonnull attStr, NSString * _Nonnull str) {
              [attStr zm_color:[UIColor colorWithHexString:@"#8E8E92"]];
              [attStr zm_font:[UIFont systemFontOfSize:12]];
              [attStr zm_strikethrough:1];
          }];
          
      }];
      
    
      self.rmbLab.attributedText = attStr;
    
    // Initialization code
}


- (void)setZhi:(NSInteger)zhi {
    self.configuration.lastTime([NSString stringWithFormat:@"%ld",[self getNowTimeTimeStampSec].integerValue+zhi]);

}

#pragma mark - CJJTimerDelegate

/// 倒计时结束回调
- (void)timerFinished:(CJJTimerView *)timer{
    NSLog(@"timerFinished倒计时结束回调");
}

#pragma mark - lazy

- (CJJTimerView *)timer{
    if(!_timer){
        _configuration = [CJJTimerViewConfiguration configureTimerView];
        
        _configuration.viewWidth(18)
        .viewHeight(18)
        .hiddenWhenFinished(YES)
        .cornerRadius(3)
        .backgroundColor([UIColor colorWithHexString:@"#FF5B57"])
        .textLabelFont([UIFont systemFontOfSize:11])
        .textLabelColor([UIColor whiteColor])
        .colonLabelFont([UIFont systemFontOfSize:11 weight:UIFontWeightBold])
        .colonLabelColor([UIColor colorWithHexString:@"#FF5B57"]);

        _timer = [CJJTimerView timerViewWithConfiguration:_configuration];
        _timer.delegate = self;
    }
    return _timer;
}
////返回秒为单位的时间戳
- (NSString *)getNowTimeTimeStampSec{

    NSDate *datenow = [NSDate date];

    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];

    return timeSp;

}

//返回毫秒为单位的时间戳
- (NSString *)getNowTimeTimestampMinSec{
    
    NSDate *datenow = [NSDate date];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)([datenow timeIntervalSince1970]*1000)];
    
    return timeSp;
}

//- (void)setupTimeLabelP{
//    
//    self.countdownLab.timeKey = @"endTime";
//    //设置文本自适应
//    self.countdownLab.textAdjustsWidthToFitFont = YES;
//    //边框模式
//    self.countdownLab.textStyle = ZJJTextStlyeHHMMSSBox;
//    //字体颜色
//    self.countdownLab.textColor = [UIColor whiteColor];
//    //单个文本背景颜色
//    self.countdownLab.textBackgroundColor = [UIColor colorWithHexString:@"#FF5B57"];
//    //设置单个文本宽度
//    self.countdownLab.textHeight = CGRectGetHeight(self.countdownLab.frame);
//    //每个文本背景间隔
//    self.countdownLab.textBackgroundInterval = 8;
//    //设置文本距离背景左右边距
//    self.countdownLab.textAdjustsWidthLeftRightSide = 5;
//    //设置圆角
//    self.countdownLab.textBackgroundRadius = 1;
//    //文本边宽颜色
//    //       self.countdownLab.textBackgroundBorderColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5];
//    //文本边框宽度
//    //       self.countdownLab.textBackgroundBorderWidth = 3;
//    
//    
//}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
