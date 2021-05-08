//
//  SyncClassTableViewCell.h
//  XTTDemo
//
//  Created by w on 2021/4/29.
//  Copyright © 2021 xtt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBTHBaseTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface SyncClassTableViewCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLab;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *rmbLab;
@property (weak, nonatomic) IBOutlet UILabel *selectClassLab;
@property (weak, nonatomic) IBOutlet UIView *lineView;

@end

NS_ASSUME_NONNULL_END
