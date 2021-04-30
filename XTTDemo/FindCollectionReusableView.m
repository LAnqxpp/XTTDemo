//
//  FindCollectionReusableView.m
//  XTTDemo
//
//  Created by w on 2021/4/30.
//  Copyright © 2021 xtt. All rights reserved.
//

#import "FindCollectionReusableView.h"
@interface FindCollectionReusableView ()
@property (nonatomic ,strong)UILabel *titleLab;
@end
@implementation FindCollectionReusableView


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        UIView *leftView = [[UIView alloc]init];
        leftView.layer.masksToBounds = YES;
        leftView.layer.cornerRadius = 5;
        leftView.backgroundColor = [UIColor colorWithHexString:@"#FF5B57"];

        [self addSubview:leftView];
        
        [self addSubview:self.titleLab];
        
        [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.mas_left).offset(20);
            make.centerY.mas_equalTo(self);
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
        
        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(leftView);
            make.left.mas_equalTo(leftView.mas_right).offset(15);
        }];
    
        
    }
    return self;
}

- (UILabel *)titleLab {
    
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
    }
    return _titleLab;
}


- (void)setTitleString:(NSString *)titleString {
    _titleString = titleString;
    self.titleLab.text = titleString;
}

@end

