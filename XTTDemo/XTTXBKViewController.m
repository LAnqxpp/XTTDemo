//
//  XTTXBKViewController.m
//  XTTDemo
//
//  Created by w on 2021/4/29.
//  Copyright © 2021 xtt. All rights reserved.
//

#import "XTTXBKViewController.h"
#import "JXCategoryView.h"
#import "LoadDataListBaseViewController.h"
#import "DishBaseViewController.h"
#import "UIWindow+JXSafeArea.h"
#import "XBKFindViewController.h"
@interface XTTXBKViewController ()<JXCategoryViewDelegate>
@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray <LoadDataListBaseViewController *> *listVCArray;
@end

@implementation XTTXBKViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    

    CGFloat naviHeight = [UIApplication.sharedApplication.keyWindow jx_navigationHeight];

    NSArray *titles = [self getRandomTitles];
    CGFloat categoryViewHeight = 34;
    CGFloat width = WindowsSize.width;
    CGFloat height = WindowsSize.height - naviHeight - categoryViewHeight;

    self.listVCArray = [NSMutableArray array];

    self.categoryView = [[JXCategoryTitleView alloc] init];
    self.categoryView.frame = CGRectMake(0, naviHeight, WindowsSize.width, categoryViewHeight);
    self.categoryView.delegate = self;
    self.categoryView.titles = titles;
    self.categoryView.titleFont = [UIFont systemFontOfSize:16];
    self.categoryView.titleSelectedColor = [UIColor colorWithHexString:@"#FB706C"];
    self.categoryView.titleColor = [UIColor colorWithHexString:@"#000000"];
    
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorColor = [UIColor colorWithHexString:@"#FB706C"];
    self.categoryView.indicators = @[lineView];
    [self.view addSubview:self.categoryView];

    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, naviHeight+ categoryViewHeight, width, height)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    if ([UIView userInterfaceLayoutDirectionForSemanticContentAttribute:UIView.appearance.semanticContentAttribute] == UIUserInterfaceLayoutDirectionRightToLeft) {
        self.scrollView.transform = CGAffineTransformMakeScale(-1, 1);
    }
    [self.view addSubview:self.scrollView];

    self.automaticallyAdjustsScrollViewInsets = NO;
    if (@available(iOS 11.0, *)) {
        if ([self.scrollView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
            self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    //FIXME:如果和自定义UIScrollView联动，删除纯UIScrollView示例
    self.categoryView.contentScrollView = self.scrollView;

    [self reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    self.navigationController.interactivePopGestureRecognizer.enabled = (self.categoryView.selectedIndex == 0);
}

/**
 重载数据源：比如从服务器获取新的数据、否则用户对分类进行了排序等
 */
- (void)reloadData {
    NSArray *titles = [self getRandomTitles];
    //先把之前的listView移除掉
    for (UIViewController *vc in self.listVCArray) {
        [vc.view removeFromSuperview];
    }
    [self.listVCArray removeAllObjects];

    for (int i = 0; i < titles.count; i ++) {
                NSString *titleString = titles[i];
        if ([titleString  isEqualToString:@"精选"]) {
            
            DishBaseViewController *dlistVC = [[DishBaseViewController alloc] initWithStyle:UITableViewStylePlain];
            dlistVC.naviController = self.navigationController;
                   dlistVC.view.frame = CGRectMake(i*self.scrollView.bounds.size.width, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
                   //如果列表是UIViewController包裹的，需要添加addChildViewController代码，这样子在iPhoneX系列手机就不会有底部安全距离错误的问题！！！
                   [self addChildViewController:dlistVC];
                   [self.listVCArray addObject:dlistVC];
        }else {
           LoadDataListBaseViewController *listVC = [[LoadDataListBaseViewController alloc] initWithStyle:UITableViewStylePlain];
            listVC.naviController = self.navigationController;
                listVC.view.frame = CGRectMake(i*self.scrollView.bounds.size.width, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
                //如果列表是UIViewController包裹的，需要添加addChildViewController代码，这样子在iPhoneX系列手机就不会有底部安全距离错误的问题！！！
                [self addChildViewController:listVC];
                [self.listVCArray addObject:listVC];
        }
        
    }

    //根据新的数据源重新添加listView
    for (int i = 0; i < titles.count; i ++) {
        NSString *titleString = titles[i];
           if ([titleString  isEqualToString:@"精选"]) {
               DishBaseViewController *dlistVC = self.listVCArray[i];
                  [self.scrollView addSubview:dlistVC.view];
               
           }else {
        
        LoadDataListBaseViewController *listVC = self.listVCArray[i];
        [self.scrollView addSubview:listVC.view];
           }
    }
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width*titles.count, self.scrollView.bounds.size.height);

    //触发首次加载
    [self.listVCArray.firstObject loadDataForFirst];

    //重载之后默认回到0，你也可以指定一个index
    self.categoryView.defaultSelectedIndex = 0;
    self.categoryView.titles = titles;
    [self.categoryView reloadData];
}

#pragma mark - JXCategoryViewDelegate

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    //侧滑手势处理
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
    [self.listVCArray[index] loadDataForFirst];
}


#pragma mark - JXCategoryListContentViewDelegate

/**
 实现 <JXCategoryListContentViewDelegate> 协议方法，返回该视图控制器所拥有的「视图」
 */
- (UIView *)listView {
    return self.view;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)tanAllert {
    
    XBKFindViewController *vc = [[XBKFindViewController alloc]init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
    
}


@end
