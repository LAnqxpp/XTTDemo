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
@interface LoadDataListBaseViewController ()
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, assign) BOOL isDataLoaded;

@end

@implementation LoadDataListBaseViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle= UITableViewCellSeparatorStyleNone;
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;

    
    self.dataSource = [NSMutableArray array];
    [self.tableView registerNib:[UINib nibWithNibName:@"SyncClassTableViewCell" bundle:nil] forCellReuseIdentifier:@"SyncClassTableViewCellId"];
    [self.tableView registerNib:[UINib nibWithNibName:@"PreferentialTableViewCell" bundle:nil] forCellReuseIdentifier:@"PreferentialTableViewCellId"];
    [self.tableView registerNib:[UINib nibWithNibName:@"TimeLimitTableViewCell" bundle:nil] forCellReuseIdentifier:@"TimeLimitTableViewCellId"];
    [self.tableView registerNib:[UINib nibWithNibName:@"FamousTeacherTableViewCell" bundle:nil] forCellReuseIdentifier:@"FamousTeacherTableViewCellId"];

    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    self.tableView.rowHeight = 185;
}

- (void)headerRefresh {
    [self.tableView.mj_header beginRefreshing];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.calendar = [NSCalendar currentCalendar];
    dateFormatter.dateFormat = @"HH:mm:ss";
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.dataSource removeAllObjects];
        for (int i = 0; i < 20; i++) {
            [self.dataSource addObject:[NSString stringWithFormat:@"%@测试数据:%d", dateString, i]];
        }
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
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        PreferentialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PreferentialTableViewCellId" forIndexPath:indexPath];
        XBKBaseModel *model = [[XBKBaseModel alloc] init];
              model.startTime = @"2021-4-30 10:18:06";
              model.endTime = @"2021-5-6 18:10:06";
              [cell.countdownLab setupCellWithModel:model indexPath:indexPath];
              cell.countdownLab.attributedText = [self.countDown countDownWithTimeLabel:cell.countdownLab];
        return cell;
    }else if (indexPath.row ==1) {
        
        SyncClassTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SyncClassTableViewCellId" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 2 ) {
        TimeLimitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TimeLimitTableViewCellId" forIndexPath:indexPath];
      
        return cell;
        
    }
        FamousTeacherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FamousTeacherTableViewCellId" forIndexPath:indexPath];
    
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


- (void)scrollViewWithAutomaticallyDeleteModel:(id)model{
    
    NSLog(@"==model:%@===endTime=%@===",model,[model valueForKey:@"endTime"]);
}


- (NSAttributedString *)customTextWithTimeLabel:(ZJJTimeCountDownLabel *)timeLabel timeCountDown:(ZJJTimeCountDown *)timeCountDown{

    NSArray *textArray = @[[NSString stringWithFormat:@"%.2ld",timeLabel.days],
                           @" 天",
                           [NSString stringWithFormat:@"  %.2ld",timeLabel.hours],
                           @" 小时",
                           [NSString stringWithFormat:@"  %.2ld",timeLabel.minutes],
                           @" 分",
                           [NSString stringWithFormat:@"  %.2ld",timeLabel.seconds],
                           @" 秒"];
    
    return [self dateAttributeWithTexts:textArray];
}

- (NSAttributedString *)dateAttributeWithTexts:(NSArray *)texts{
    
    NSDictionary *datedic = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:20],NSForegroundColorAttributeName:[UIColor orangeColor]};
    NSMutableAttributedString *dateAtt = [[NSMutableAttributedString alloc] init];
    
    [texts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *text = (NSString *)obj;
        //说明是时间字符串
        if ([text integerValue] || [text rangeOfString:@"0"].length) {
            [dateAtt appendAttributedString:[[NSAttributedString alloc] initWithString:text attributes:datedic]];
        }else{
            
            UIColor *color = idx%3?[UIColor greenColor]:[UIColor blueColor];
            [dateAtt appendAttributedString:[[NSAttributedString alloc] initWithString:text attributes:@{NSForegroundColorAttributeName:color}]];
        }
        
    }];
    return dateAtt;
}


- (void)addData{


    NSArray *arr = @[@"2017-2-5 12:10:09",
                      @"2017-3-5 12:10:06",
                      @"2022-7-10 18:6:15",
                      @"2017-8-5 18:10:08",
                     @"2017-10-5 18:10:06",
                     @"2027-7-10 18:6:16",
                     @"2021-8-5 18:14:22",
                     @"2017-9-5 18:10:06",
                     @"2019-10-5 18:15:33",
                     @"2017-6-5 12:16:22",
                     @"2020-7-10 18:6:16",
                     @"2017-8-5 12:09:05",
                     @"2019-9-5 18:10:06",
                     @"2017-10-5 18:10:09",
                     @"2017-8-5 18:10:06",
                     @"2018-9-5 18:10:08",
                     @"2017-10-5 18:10:06",
                     @"2019-8-5 18:10:10",
                     @"2007-10-5 18:10:06",
                     @"2018-8-5 18:10:45",
                     @"2017-9-5 18:10:01",
                     @"2018-10-5 18:10:06",
                     @"2017-8-5 18:14:03",
];
    
    
    for (int i = 0; i < arr.count; i ++) {
        
        XBKBaseModel *model = [XBKBaseModel new];
        model.endTime = arr[i];
        [self.dataList addObject:model];
    }
    
    //移除过时数据
//    [self removeOutDate];
  
}

//移除过时数据
- (void)removeOutDate{

    for (NSInteger i = self.dataList.count-1; i >= 0; i--) {
        
        XBKBaseModel *model = self.dataList[i];
        if ([self.countDown isOutDateWithModel:model]) {
            [self.dataList removeObject:model];
        }
    }
}


- (ZJJTimeCountDown *)countDown{

    XBKBaseModel *model = [[XBKBaseModel alloc] init];
           model.startTime = @"2021-4-30 10:18:06";
           model.endTime = @"2021-5-6 18:10:06";
    [self.dataList addObject:model];
    if (!_countDown) {
        _countDown = [[ZJJTimeCountDown alloc] initWithScrollView:self.tableView dataList:self.dataList];
        _countDown.delegate = self;
    }
    return _countDown;
}



- (void)dealloc {
    
    self.didScrollCallback = nil;
    /// 2.销毁
    [_countDown destoryTimer];
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
