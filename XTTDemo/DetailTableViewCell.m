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
    
    self.collectionView.delegate = self;
       self.collectionView.dataSource = self;
       [self.collectionView registerNib:[UINib nibWithNibName:@"DetailCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"DetailCollectionViewCellId"];
       
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
    
    return CGSizeMake(w, 35);
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 2.5, 0, 2.5);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"我点击头像 %ld",indexPath.row);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
