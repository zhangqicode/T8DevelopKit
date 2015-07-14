//
//  DQBaseViewController.m
//  DaQuan
//
//  Created by yewei on 15/5/28.
//  Copyright (c) 2015年 Think. All rights reserved.
//

#import "T8BaseViewController.h"
#import "T8Defines.h"

@interface T8BaseViewController ()

@end

@implementation T8BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColorRGB(0xECECEC);
    
    NSInteger x = [self.navigationController.viewControllers count];
    
    if (x > 1) {
        // 多余一级的时候，创建返回按钮
        [self setLeftBarButtonItem:[T8BaseViewController navigationBackButtonItemWithTarget:self action:@selector(popViewController)]];
    }else{
        [self setLeftBarButtonItem:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark NavigationColor
- (void)setNavigationBarColor:(UIColor *)navigationBarColor
{
    [self.navigationController.navigationBar setBarTintColor:navigationBarColor];
}

#pragma mark Navigation Text Button
- (void)setLeftBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    if (!barButtonItem) {
        if ([self.navigationController.viewControllers count] > 1) {
            self.navigationItem.hidesBackButton = YES;
        }
        self.navigationItem.leftBarButtonItems = nil;
        return;
    }
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    
    negativeSpacer.width = -15;
    
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, barButtonItem, nil];
}

- (void)setRightBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -15;
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, barButtonItem, nil];
}

- (void)setLeftBarButtonItems:(NSArray *)barButtonItems
{
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -10;
    
    NSMutableArray *items = [barButtonItems mutableCopy];
    [items insertObject:negativeSpacer atIndex:0];
    
    self.navigationItem.leftBarButtonItems = items;
}

- (void)setRightBarButtonItems:(NSArray *)barButtonItems
{
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -10;
    
    NSMutableArray *items = [barButtonItems mutableCopy];
    [items insertObject:negativeSpacer atIndex:0];
    
    self.navigationItem.rightBarButtonItems = items;
}

- (void)setLeftBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIBarButtonItem *item = [self navigationDefaultItemWithTitle:title Target:target action:action];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -5;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, item, nil];
}

- (void)setRightBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIBarButtonItem *item = [self navigationDefaultItemWithTitle:title Target:target action:action];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -5;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, item, nil];
}

- (UIBarButtonItem *)leftBarButtonItem
{
    if ((self.navigationItem.leftBarButtonItems != nil) && (self.navigationItem.leftBarButtonItems.count == 0)) {
        return nil;
    }
    
    return self.navigationItem.leftBarButtonItems.lastObject;
}

- (UIBarButtonItem *)rightBarButtonItem
{
    if ((self.navigationItem.rightBarButtonItem != nil) && (self.navigationItem.rightBarButtonItems.count == 0)) {
        return nil;
    }
    
    return self.navigationItem.rightBarButtonItems.lastObject;
}

+ (UIBarButtonItem *)navigationBackButtonItemWithTarget:(id)target action:(SEL)action
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 44, 44);
    [backButton setImage:[UIImage imageNamed:@"back_button"] forState:UIControlStateNormal];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    return backButtonItem;
}

- (UIBarButtonItem *)navigationDefaultItemWithTitle:(NSString *)title Target:(id)target action:(SEL)action
{
    UIButton *btn = [self makeDefaultItemButton];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

- (UIBarButtonItem *)navigationDefaultItemWithImageNamed:(NSString *)imageName Target:(id)target action:(SEL)action
{
    UIButton *btn = [self makeDefaultItemButton];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

//could override to make your own style
- (UIButton *)makeDefaultItemButton
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    return btn;
}

- (void)popViewController
{
    NSArray *viewControllers = [self.navigationController viewControllers];
    if (1 < viewControllers.count && self == [viewControllers lastObject]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
