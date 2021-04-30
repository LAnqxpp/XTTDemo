//
//  ViewController.m
//  XTTDemo
//
//  Created by w on 2021/4/29.
//  Copyright © 2021 xtt. All rights reserved.
//

#import "ViewController.h"
#import "XTTXBKViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *titleString = @"我是标题！我是标题！我是标！我是标题！";
    //创建  NSMutableAttributedString 富文本对象
    NSMutableAttributedString *maTitleString = [[NSMutableAttributedString alloc] initWithString:titleString];
    //创建一个小标签的Label
    NSString *aa = @"标签";
    CGFloat aaW = 12*aa.length +6;
    UILabel *aaL = [UILabel new];
    aaL.frame = CGRectMake(0, 0, aaW*3, 16*3);
    aaL.text = aa;
    aaL.font = [UIFont boldSystemFontOfSize:12*3];
    aaL.textColor = [UIColor whiteColor];
    aaL.backgroundColor = [UIColor redColor];
    aaL.textAlignment = NSTextAlignmentCenter;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:aaL.bounds byRoundingCorners:UIRectCornerBottomRight | UIRectCornerTopLeft cornerRadii:CGSizeMake(10,10)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = aaL.bounds;
    maskLayer.path = maskPath.CGPath;
    aaL.layer.mask = maskLayer;
    aaL.layer.masksToBounds = NO;
//    aaL.backgroundColor = [UIColor whiteColor];
//    aaL.layer.shadowColor = [UIColor blackColor].CGColor;
    aaL.layer.shadowOffset = CGSizeMake(0,-4);   //0,0围绕阴影四周  0,4向下有4个像素的偏移
    aaL.layer.shadowOpacity = 0.15;   //设置阴影透明度
    aaL.layer.shadowRadius = 5;      //设置阴影圆角
    
    
    //调用方法，转化成Image
    UIImage *image = [self imageWithUIView:aaL];
    //创建Image的富文本格式
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.bounds = CGRectMake(0, -2.5, aaW, 16); //这个-2.5是为了调整下标签跟文字的位置
    attach.image = image;
    //添加到富文本对象里
    NSAttributedString * imageStr = [NSAttributedString attributedStringWithAttachment:attach];
    [maTitleString insertAttributedString:imageStr atIndex:0];//加入文字前面
    //[maTitleString appendAttributedString:imageStr];//加入文字后面
    //[maTitleString insertAttributedString:imageStr atIndex:4];//加入文字第4的位置

    //注意 ：创建这个Label的时候，frame，font，cornerRadius要设置成所生成的图片的3倍，也就是说要生成一个三倍图，否则生成的图片会虚，同学们可以试一试。

  
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.frame = CGRectMake(50, 200, 250, 100);
    titleLabel.backgroundColor = [UIColor yellowColor];
    titleLabel.numberOfLines = 0;
    [self.view addSubview:titleLabel];
    titleLabel.attributedText = maTitleString;
   
    // Do any additional setup after loading the view.
}
  //view转成image
- (UIImage*) imageWithUIView:(UIView*) view{
    
       UIGraphicsBeginImageContext(view.bounds.size);
       CGContextRef ctx = UIGraphicsGetCurrentContext();
       [view.layer renderInContext:ctx];
       UIImage* tImage = UIGraphicsGetImageFromCurrentImageContext();
       UIGraphicsEndImageContext();
       return tImage;
   }

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    XTTXBKViewController *tVC = [[XTTXBKViewController alloc]init];
    
    [self.navigationController pushViewController:tVC animated:YES];
    
    
}

@end
