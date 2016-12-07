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
    
    self.view.backgroundColor = AppBgColor;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.appearing = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //  设置backBarButtonItem
    //  首先判断有没有设置VC的title属性，要是设置了就直接用；否则，看看是不是设置了navigationItem的title属性，要是设置了就用；否则，就不设置backBarButtonItem了。不设置的话就会自动用系统自己的，backBarButtonItem的title为“返回”。
    NSString *title = self.title;
    title = @" ";
    if (!title || title.length <= 0) {
        title = self.navigationItem.title;
    }
    if (title && title.length > 0) {
        [self setBackBarButtonItem:[T8BaseViewController navigationBackButtonItemWithTarget:self action:@selector(popViewController) title:title]];
    }
    
    self.appearing = NO;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    self.appearing = NO;
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
- (void)setBackBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.navigationItem.backBarButtonItem  = barButtonItem;
}

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

- (UIBarButtonItem *)backBarButtonItem
{
    return self.navigationItem.backBarButtonItem;
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

+ (UIBarButtonItem *)customNavigationBackButtonItemWithTarget:(id)target action:(SEL)action title:(NSString *)title
{
    title = @" ";
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    if (title.length && title.length <= 4) {
        [backButton setTitle:title forState:UIControlStateNormal];
        backButton.frame = CGRectMake(0, 0, 60, 44);
    } else {
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        backButton.frame = CGRectMake(0, 0, 60, 44);
    }
    [backButton setTitleColor:AssistContentColor forState:UIControlStateNormal];
    [backButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
    
    [backButton setImage:[[UIImage imageNamed:@"back_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [backButton setImageEdgeInsets:UIEdgeInsetsMake(-2, 6, 2, 0)];
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    return backButtonItem;
}

+ (UIBarButtonItem *)navigationBackButtonItemWithTarget:(id)target action:(SEL)action title:(NSString *)title
{
    NSString *backTitle = title;
    if (!title || title.length > 4 || title.length <= 0) {
        backTitle = @"返回";
    } else {
        if (title.length == 1) {
            backTitle = [NSString stringWithFormat:@"%@  ", backTitle];
        }
    }
    
    return [[UIBarButtonItem alloc] initWithTitle:backTitle style:UIBarButtonItemStylePlain target:self action:action];
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
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
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
