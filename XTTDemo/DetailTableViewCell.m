//
//  DetailTableViewCell.m
//  XTTDemo
//
//  Created by w on 2021/4/30.
//  Copyright © 2021 xtt. All rights reserved.
//

#import "DetailTableViewCell.h"
#import "DetailCollectionViewCell.h"
@implementation DetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = [UIColor colorWithHexString:@"#F4F5F9"];
    self.lineView.backgroundColor = [UIColor colorWithHexString:@"#E5E5EA"];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.collectionView.delegate = self;
       self.collectionView.dataSource = self;
       [self.collectionView registerNib:[UINib nibWithNibName:@"DetailCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"DetailCollectionViewCellId"];
    
    NSMutableAttributedString *attStr = [NSMutableAttributedString zm_initWithStr:@"剩余" customBlock:^(NSMutableAttributedString * att) {
        
           [att zm_color:[UIColor colorWithHexString:@"#000000"]];
           [att zm_font:[UIFont systemFontOfSize:12]];
        
           [att zm_appendStr:@"15" block:^(NSMutableAttributedString * _Nonnull attStr, NSString * _Nonnull str) {
               [attStr zm_color:[UIColor colorWithHexString:@"#FF5B57"]];
               [attStr zm_font:[UIFont systemFontOfSize:12]];
               
               [attStr zm_appendStr:@"名额" block:^(NSMutableAttributedString * _Nonnull attStr, NSString * _Nonnull str) {
                           [attStr zm_color:[UIColor colorWithHexString:@"#000000"]];
                           [attStr zm_font:[UIFont systemFontOfSize:12]];
                           
                }];
               
           }];
        

           
       }];
       
       self.selectClassLab.attributedText = attStr;
       
    // Initialization code
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DetailCollectionViewCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"DetailCollectionViewCellId" forIndexPath:indexPath];
    
    return item;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat space = 42.5;
    CGFloat w = ([UIScreen mainScreen].bounds.size.width -2*space - 2*30)/3;
    return CGSizeMake(floorf(w), 32);
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 2.5, 0, 2.5);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"我点击头像 %ld",indexPath.row);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)nextAction:(UIButton *)sender {
    
    
}

@end
