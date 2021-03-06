//
//  LoadDataListBaseViewController.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/28.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "LoadDataListBaseViewController.h"
#import "DetailViewController.h"
#import "MJRefresh/MJRefresh.h"
#import "SyncClassTableViewCell.h"
#import "PreferentialTableViewCell.h"
#import "TimeLimitTableViewCell.h"
#import "FamousTeacherTableViewCell.h"
#import "XBKBaseModel.h"
#import "XBKCellFactory.h"

@interface LoadDataListBaseViewController ()
@property (nonatomic, assign) BOOL isDataLoaded;

@end

@implementation LoadDataListBaseViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle= UITableViewCellSeparatorStyleNone;
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;

    [self.tableView registerNib:[UINib nibWithNibName:@"SyncClassTableViewCell" bundle:nil] forCellReuseIdentifier:@"SyncClassTableViewCellId"];
    [self.tableView registerNib:[UINib nibWithNibName:@"PreferentialTableViewCell" bundle:nil] forCellReuseIdentifier:@"PreferentialTableViewCellId"];
    [self.tableView registerNib:[UINib nibWithNibName:@"TimeLimitTableViewCell" bundle:nil] forCellReuseIdentifier:@"TimeLimitTableViewCellId"];
    [self.tableView registerNib:[UINib nibWithNibName:@"FamousTeacherTableViewCell" bundle:nil] forCellReuseIdentifier:@"FamousTeacherTableViewCellId"];

    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    
   
    
    XBKBaseModel *model2 = [[XBKBaseModel alloc]init];
     model2.type = @"2";
    model2.title = @"同步";
     model2.subTitle = @"同步";
    

    
    self.dataList = @[model2,model2,model2,model2].mutableCopy;
}

- (void)headerRefresh {
    [self.tableView.mj_header beginRefreshing];
   
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.dataList removeAllObjects];
       
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    });
}

- (void)loadDataForFirst {
    //第一次才加载，后续触发的不处理
    if (!self.isDataLoaded) {
        [self headerRefresh];
        self.isDataLoaded = YES;
    }
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    !self.didScrollCallback ?: self.didScrollCallback(scrollView);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  
        SyncClassTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SyncClassTableViewCellId" forIndexPath:indexPath];
        return cell;
  
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *vc = [[DetailViewController alloc] init];
    if (self.navigationController != nil) {
        [self.navigationController pushViewController:vc animated:true];
    } else {
        //仅仅是自定义列表容器示例才生效
        [self.naviController pushViewController:vc animated:true];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    XBKBaseModel *model = self.dataList[indexPath.row];
    return [XBKCellFactory cellHightWithModel:model];
}


- (NSMutableArray *)dataList{
    
    if (!_dataList) {
        
        _dataList = [NSMutableArray array];
        
    }
    
    return _dataList;
}



#pragma mark - DZNEmptyDataSetSource Methods

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"更多阶段课程正在定制中~~~";
    
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0],
                                 NSForegroundColorAttributeName: [UIColor colorWithHexString:@"#000000"],
                                 NSParagraphStyleAttributeName: paragraphStyle};
    
    return [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"即将上线哦！";
    
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0],
                                 NSForegroundColorAttributeName: [UIColor colorWithHexString:@"#000000"],
                                 NSParagraphStyleAttributeName: paragraphStyle};
    
    return [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    NSString *text = @"催一催";
    UIFont *font = [UIFont systemFontOfSize:14];
    UIColor *textColor = [UIColor redColor];
    NSMutableDictionary *attributes = [NSMutableDictionary new];
      if (font) [attributes setObject:font forKey:NSFontAttributeName];
      if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
      
      return [[NSAttributedString alloc] initWithString:text attributes:attributes];
    
}



- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"placeholder_dropbox"];
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor colorWithHexString:@"#F4F5F9"];
}

- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView
{
    return nil;
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView
{
    return 0;
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    
      return -self.tableView.tableHeaderView.frame.size.height/2.0f;
}

#pragma mark - DZNEmptyDataSetSource Methods

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return NO;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{

    NSLog(@"%s",__FUNCTION__);
}
- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
    NSLog(@"%s",__FUNCTION__);
}

@end
