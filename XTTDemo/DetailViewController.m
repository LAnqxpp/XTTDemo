//
//  DetailViewController.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/12/25.
//  Copyright © 2018 jiaxin. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailTableViewCell.h"
@interface DetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UILabel *testLabel;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation DetailViewController

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"测试详情页面";
    self.view.backgroundColor = [UIColor whiteColor];

//    self.testLabel = [[UILabel alloc] init];
//    self.testLabel.text = @"这是一个测试详情页面\n点击空白处返回上一级页面或关闭页面";
//    self.testLabel.numberOfLines = 0;
//    self.testLabel.textAlignment = NSTextAlignmentCenter;
//    self.testLabel.textColor = [UIColor blackColor];
//    self.testLabel.font = [UIFont systemFontOfSize:20];
//    [self.view addSubview:self.testLabel];
    
    [self.view addSubview:self.tableView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

//    [self.testLabel sizeToFit];
//    self.testLabel.center = self.view.center;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.presentingViewController || self.navigationController.presentingViewController) {
        [self dismissViewControllerAnimated:true completion:nil];
    }else {
        [self.navigationController popViewControllerAnimated:true];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailTableViewCellId" forIndexPath:indexPath];
    
    return cell;
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 200;
        [_tableView registerNib:[UINib nibWithNibName:@"DetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"DetailTableViewCellId"];
    }
    
    return _tableView;
}

@end
