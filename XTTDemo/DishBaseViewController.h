//
//  DishBaseViewController.h
//  HHHHHHHH
//
//  Created by w on 2021/5/8.
//  Copyright © 2021 xtt. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DishBaseViewController : UITableViewController
<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property(nonatomic,strong) NSMutableArray *dataList;

@property (nonatomic, strong) UINavigationController *naviController;
@property (nonatomic, copy) void(^didScrollCallback)(UIScrollView *scrollView);
- (void)loadDataForFirst;
@end

NS_ASSUME_NONNULL_END
