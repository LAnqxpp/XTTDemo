//
//  FeedBackViewController.m
//  XTTDemo
//
//  Created by w on 2021/5/6.
//  Copyright © 2021 xtt. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()

@property (nonatomic ,strong)UIView *bgView;

@property (nonatomic ,strong)UIImageView *imgViewType;

@property (nonatomic ,strong)UIButton *closeBtn;

@end

@implementation FeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:84/255.0 green:84/255.5 blue:86/255.0 alpha:1];
    [self addUI];
    
    
    // Do any additional setup after loading the view.
}
- (void)addUI
{
    [self.view addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(270, 336));
        
    }];
    
    [self.bgView addSubview:self.imgViewType];
    
    [self.imgViewType mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(self.bgView.mas_top).offset(64);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    UILabel *fbSuccessLab = [[UILabel alloc]init];
    fbSuccessLab.text = @"反馈成功！";
    fbSuccessLab.font = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
    [self.bgView addSubview:fbSuccessLab];
    
    UILabel *weLab = [[UILabel alloc]init];
    weLab.text = @"我们已收到您的反馈";
    weLab.font = [UIFont systemFontOfSize:12];
    weLab.textColor = [UIColor colorWithHexString:@"#8E8E92"];
    [self.bgView addSubview:weLab];
    
    UILabel *noticeLab = [[UILabel alloc]init];
    noticeLab.textColor = [UIColor colorWithHexString:@"#8E8E92"];
    noticeLab.font = [UIFont systemFontOfSize:12];
    noticeLab.text = @"课程完善后将第一时间通知您！";
    [self.bgView addSubview:noticeLab];
    
    UIButton *checkClassBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkClassBtn setTitle:@"查看其它课程" forState:UIControlStateNormal];
    checkClassBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    checkClassBtn.layer.cornerRadius = 18;
    checkClassBtn.layer.masksToBounds = YES;
    checkClassBtn.backgroundColor = [UIColor colorWithHexString:@"#FB706C"];
    [self.bgView addSubview:checkClassBtn];
    
    
    [fbSuccessLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.imgViewType.mas_bottom).offset(30);
        make.centerX.mas_equalTo(self.imgViewType);
        make.height.mas_equalTo(20);
        
    }];
    
    [weLab mas_makeConstraints:^(MASConstraintMaker *make) {
           
           make.top.mas_equalTo(fbSuccessLab.mas_bottom).offset(5);
           make.centerX.mas_equalTo(self.imgViewType);
           
           
       }];
    [noticeLab mas_makeConstraints:^(MASConstraintMaker *make) {
           
           make.top.mas_equalTo(weLab.mas_bottom).offset(10);
           make.centerX.mas_equalTo(self.imgViewType);
           
           
       }];
    
    
    [checkClassBtn mas_makeConstraints:^(MASConstraintMaker *make) {
             
        make.top.mas_equalTo(noticeLab.mas_bottom).offset(26.5);
             make.centerX.mas_equalTo(self.imgViewType);
            make.width.mas_equalTo(130);
            make.height.mas_equalTo(36);
        }];
    [self.view addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.mas_equalTo(self.imgViewType);
        make.top.mas_equalTo(self.bgView.mas_bottom).offset(27.5);
        make.size.mas_equalTo(CGSizeMake(52, 52));
    }];
    
}

- (void)closeBtnAction {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor whiteColor];
       _bgView.layer.masksToBounds = YES;
         _bgView.layer.cornerRadius = 5;
    }
    return _bgView;
}

- (UIImageView *)imgViewType {
    if (!_imgViewType) {
        _imgViewType = [[UIImageView alloc]init];
    }
    return _imgViewType;
}

- (UIButton *)closeBtn {
    
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeBtn setImage:[UIImage imageNamed:@"chahao"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(closeBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
