//
//  DQBaseViewController.h
//  DaQuan
//
//  Created by yewei on 15/5/28.
//  Copyright (c) 2015年 Think. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface T8BaseViewController : UIViewController

@property (nonatomic, strong) UIColor *navigationBarColor;

#pragma mark Navigation Text Button
- (void)setLeftBarButtonItem:(UIBarButtonItem *)barButtonItem;
- (void)setRightBarButtonItem:(UIBarButtonItem *)barButtonItem;

- (UIBarButtonItem *)leftBarButtonItem;
- (UIBarButtonItem *)rightBarButtonItem;

@end
