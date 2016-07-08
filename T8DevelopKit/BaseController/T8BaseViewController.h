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

- (void)setBackBarButtonItem:(UIBarButtonItem *)barButtonItem;
- (void)setLeftBarButtonItem:(UIBarButtonItem *)barButtonItem;
- (void)setRightBarButtonItem:(UIBarButtonItem *)barButtonItem;

- (void)setLeftBarButtonItems:(NSArray *)barButtonItems;
- (void)setRightBarButtonItems:(NSArray *)barButtonItems;

- (void)setLeftBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
- (void)setRightBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

- (UIBarButtonItem *)navigationDefaultItemWithTitle:(NSString *)title Target:(id)target action:(SEL)action;
- (UIBarButtonItem *)navigationDefaultItemWithImageNamed:(NSString *)imageName Target:(id)target action:(SEL)action;

- (UIBarButtonItem *)backBarButtonItem;
- (UIBarButtonItem *)leftBarButtonItem;
- (UIBarButtonItem *)rightBarButtonItem;

+ (UIBarButtonItem *)navigationBackButtonItemWithTarget:(id)target action:(SEL)action title:(NSString *)title;
+ (UIBarButtonItem *)customNavigationBackButtonItemWithTarget:(id)target action:(SEL)action title:(NSString *)title;

@end
