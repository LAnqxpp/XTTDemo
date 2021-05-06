//
//  UIViewController+KKExtension.m
//  UIPresentationController
//
//  Created by 吴灶洲 on 2018/3/3.
//  Copyright © 2018年 吴灶洲. All rights reserved.
//

#import "UIViewController+KKExtension.h"
#import "KKPresentBottom.h"
#import <objc/runtime.h>

@implementation UIViewController (KKExtension)

- (void)setControllerRect:(CGRect)controllerRect {
     objc_setAssociatedObject(self, @"Rect", @(controllerRect), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGRect)controllerRect {
    return [objc_getAssociatedObject(self, @"Rect") CGRectValue];
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return [[KKPresentBottom alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}


- (void)modal:(UIViewController *)vc controllerRect:(CGRect)controllerRect
{
    vc.modalPresentationStyle = UIModalPresentationCustom;
       vc.controllerRect = controllerRect;
       vc.transitioningDelegate = self;
       [self presentViewController:vc animated:YES completion:nil];
    
}
@end
