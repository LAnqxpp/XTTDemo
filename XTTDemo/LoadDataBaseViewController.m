//
//  LoadDataBaseViewController.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/12/19.
//  Copyright © 2018 jiaxin. All rights reserved.
//

#import "LoadDataBaseViewController.h"

@interface LoadDataBaseViewController ()

@end

@implementation LoadDataBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"刷新数据" style:UIBarButtonItemStylePlain target:self action:@selector(reloadData)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"点击" style:UIBarButtonItemStylePlain target:self action:@selector(tanAllert)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
}

- (NSArray <NSString *> *)getRandomTitles {
    NSMutableArray *titles = @[@"精选", @"数学",@"英语", @"语文", @"化学", @"物理"].mutableCopy;
    return titles;
}

- (void)reloadData {
    
}

- (void)tanAllert {
    
}


@end
