//
//  UIViewController+KKExtension.h
//  UIPresentationController
//
//  Created by 吴灶洲 on 2018/3/3.
//  Copyright © 2018年 吴灶洲. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (KKExtension)<UIViewControllerTransitioningDelegate>

/** 控制器rect */
@property (assign, nonatomic) CGRect controllerRect;


- (void)modal:(UIViewController *)vc controllerRect:(CGRect)controllerRect;

@end
