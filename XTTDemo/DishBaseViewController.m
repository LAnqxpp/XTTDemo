//
//  DishBaseViewController.m
//  HHHHHHHH
//
//  Created by w on 2021/5/8.
//  Copyright © 2021 xtt. All rights reserved.
//

#import "DishBaseViewController.h"
#import "DetailViewController.h"
#import "MJRefresh/MJRefresh.h"
#import "SyncClassTableViewCell.h"
#import "PreferentialTableViewCell.h"
#import "TimeLimitTableViewCell.h"
#import "FamousTeacherTableViewCell.h"
#import "XBKBaseModel.h"
#import "XBKCellFactory.h"

@interface DishBaseViewController ()
@property (nonatomic, assign) BOOL isDataLoaded;
@property (nonatomic,strong)SDCycleScrollView *sdcView;

@end

@implementation DishBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle= UITableViewCellSeparatorStyleNone;
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 180)];
     
     
     self.sdcView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(15, 0, [UIScreen mainScreen].bounds.size.width-30, 130) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
     self.sdcView.delegate = self;;
     NSArray *imagesURLStrings = @[
                               @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                               @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                               @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                               ];
     self.sdcView.imageURLStringsGroup = imagesURLStrings;
    self.sdcView.pageControlBottomOffset = -50;
     [headView addSubview:self.sdcView];
    
    self.tableView.tableHeaderView  = headView;

    [self.tableView registerNib:[UINib nibWithNibName:@"SyncClassTableViewCell" bundle:nil] forCellReuseIdentifier:@"SyncClassTableViewCellId"];
    [self.tableView registerNib:[UINib nibWithNibName:@"PreferentialTableViewCell" bundle:nil] forCellReuseIdentifier:@"PreferentialTableViewCellId"];
    [self.tableView registerNib:[UINib nibWithNibName:@"TimeLimitTableViewCell" bundle:nil] forCellReuseIdentifier:@"TimeLimitTableViewCellId"];
    [self.tableView registerNib:[UINib nibWithNibName:@"FamousTeacherTableViewCell" bundle:nil] forCellReuseIdentifier:@"FamousTeacherTableViewCellId"];

    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    
    XBKBaseModel *model1 = [[XBKBaseModel alloc]init];
    model1.type = @"1";
    model1.startTime = @"2021-4-30 10:18:06";
    model1.endTime = @"2021-5-6 18:10:06";
    model1.title = @"倒计时";
    model1.subTitle = @"dajishi";
    
    XBKBaseModel *model2 = [[XBKBaseModel alloc]init];
     model2.type = @"2";
    model2.title = @"同步";
     model2.subTitle = @"同步";
    
    XBKBaseModel *model3 = [[XBKBaseModel alloc]init];
     model3.type = @"3";
    model3.title = @"限时";
     model3.subTitle = @"限时";
    
    XBKBaseModel *model4 = [[XBKBaseModel alloc]init];
     model4.type = @"4";
    model4.title = @"教师";
     model4.subTitle = @"教师";
    
    self.dataList = @[model1,model2,model3,model4].mutableCopy;
    // Do any additional setup after loading the view.
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
    
    if (indexPath.row == 0) {
        PreferentialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PreferentialTableViewCellId" forIndexPath:indexPath];
        [cell setZhi:100];
        return cell;
    }
    
    else if (indexPath.row ==1) {

        SyncClassTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SyncClassTableViewCellId" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 2 ) {
        TimeLimitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TimeLimitTableViewCellId" forIndexPath:indexPath];

        return cell;

    }
        FamousTeacherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FamousTeacherTableViewCellId" forIndexPath:indexPath];
     return cell;
    
//    XBKBaseModel *model = self.dataList[indexPath.row];
//
//    return  [XBKCellFactory cellWithTableView:tableView Model:model IndexPath:indexPath];
    
    
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
