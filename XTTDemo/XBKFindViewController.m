//
//  XBKFindViewController.m
//  XTTDemo
//
//  Created by w on 2021/4/30.
//  Copyright © 2021 xtt. All rights reserved.
//

#import "XBKFindViewController.h"
#import "FindCollectionViewCell.h"
#import "FindCollectionReusableView.h"
@interface XBKFindViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic ,strong)UICollectionView *collectionView;
@end

@implementation XBKFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addUI];
    // Do any additional setup after loading the view.
}

- (void)addUI
{
    UIButton *closeBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:closeBtn];
    [closeBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(self.view.mas_top).offset(40);
        make.right.mas_equalTo(self.view.mas_right).offset(-15);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    UILabel *findLab = [[UILabel alloc]init];
    findLab.font = [UIFont systemFontOfSize:22.5 weight:UIFontWeightMedium];
    findLab.text = @"发现";
    [self.view addSubview:findLab];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"最热门的课程" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn setTitleColor:[UIColor colorWithHexString:@"#27364E"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UILabel *subLab= [[UILabel alloc]init];
    subLab.textColor = [UIColor colorWithHexString:@"#8E8E92"];
    subLab.font = [UIFont systemFontOfSize:14];
    subLab.text = @"请设置当前所在年级";
    [self.view addSubview:subLab];
    
    [findLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(71);
        make.left.mas_equalTo(self.view.mas_left).offset(18);
    }];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(findLab);
        make.left.mas_equalTo(findLab.mas_right).offset(11);
    }];
    
    [subLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(findLab.mas_bottom).offset(9);
        make.left.mas_equalTo(self.view.mas_left).offset(18);
    }];
    
    
    [self.view addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(subLab.mas_bottom).offset(35);
        make.left.right.bottom.mas_equalTo(self.view);

    }];
}

- (void)dismiss:(UIButton *)sender
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FindCollectionViewCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"FindCollectionViewCellId" forIndexPath:indexPath];
    
    
    return item;
    
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath

{
    UICollectionReusableView *reusableview = nil;
    
     if (kind == UICollectionElementKindSectionHeader) {
         
         
    
    FindCollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FindCollectionReusableViewId" forIndexPath:indexPath];
    
    
    headView.titleString = @[@"小学",@"初中",@"高中"][indexPath.section];
         reusableview = headView;
         
     }
    
    return reusableview;
}

-(UICollectionView *)collectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 25;
    layout.minimumInteritemSpacing = 20;
    layout.itemSize = CGSizeMake(77, 29);
    layout.sectionInset = UIEdgeInsetsMake(12, 45, 48, 45);
    layout.headerReferenceSize=CGSizeMake(self.view.frame.size.width, 30);//头视图的大小
    if (!_collectionView) {
        
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"FindCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FindCollectionViewCellId"];
        [_collectionView registerClass:[FindCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FindCollectionReusableViewId"];
    }
    return _collectionView;
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
