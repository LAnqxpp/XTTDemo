//
//  SyncClassTableViewCell.m
//  XTTDemo
//
//  Created by w on 2021/4/29.
//  Copyright © 2021 xtt. All rights reserved.
//

#import "SyncClassTableViewCell.h"
#import "TeacherIconCollectionViewCell.h"
@implementation SyncClassTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = [UIColor colorWithHexString:@"#F4F5F9"];
    self.lineView.backgroundColor = [UIColor colorWithHexString:@"#E5E5EA"];

    NSString *titleString = @" 我是标题！我是标题！我是标！我是标题 我是标题！我是标题！我是标！我是标题 ！";
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
         aaL.backgroundColor = [UIColor colorWithHexString:@"#010101"];
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

       
     
     self.titleLab.attributedText = maTitleString;

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"TeacherIconCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"TeacherIconCollectionViewCellId"];
    
    self.rmbLab.textColor =  [UIColor colorWithHexString:@"#FF5B57"];
    self.subTitleLab.textColor =  [UIColor colorWithHexString:@"#8E8E92"];
    self.selectClassLab.textColor =  [UIColor colorWithHexString:@"#FF5B57"];

    // Initialization code
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


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TeacherIconCollectionViewCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"TeacherIconCollectionViewCellId" forIndexPath:indexPath];
    
    return item;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(30, 30);
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 2.5, 0, 2.5);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"我点击头像 %ld",indexPath.row);
}


@end
