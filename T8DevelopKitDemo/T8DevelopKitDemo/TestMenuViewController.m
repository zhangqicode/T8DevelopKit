//
//  TestMenuViewController.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/19.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "TestMenuViewController.h"
#import "T8MenuTitleItem.h"
#import "T8MenuTextFieldItem.h"
#import "T8MenuDescriptionItem.h"
#import "T8MenuTextViewItem.h"
#import "T8MenuTitleCustomViewItem.h"
#import "T8MenuFunctionItem.h"
#import "T8MenuSwitchItem.h"
#import "T8CameraHelper.h"

@interface TestMenuViewController ()

@property (nonatomic) T8MenuTitleCustomViewItem *custom1;
@property (nonatomic) T8MenuTitleItem *subTitleItem;

@end

@implementation TestMenuViewController

- (id)init
{
    self = [super init];
    if (self) {
        T8MenuTitleItem *item = [[T8MenuTitleItem alloc] initWithTitle:@"123" indicator:YES subTitle:@"faweijgoijoiawefiauwhegiuawhfeiawjefiawhgruiafhiuw"];
        item.title = @"321";
        T8MenuTitleItem *itemm = [[T8MenuTitleItem alloc] initWithTitle:@"gwae" indicator:NO subTitle:nil];
        self.subTitleItem = itemm;
        T8MenuTextFieldItem *textFieldItem = [[T8MenuTextFieldItem alloc] initWithPlaceHolder:@"name" initialValue:@"zhangqi"];
        textFieldItem.text = @"qizhang";
        T8MenuDescriptionItem *descItem = [[T8MenuDescriptionItem alloc] initWithDescription:@"群ID将用于群组的URL或搜索群组，群ID不可以于现有的重复fawefafweawefw"];
        T8MenuTextViewItem *textViewItem = [[T8MenuTextViewItem alloc] initWithPlaceHolder:@"电影迷们都在这里，只讨论电影相关电影迷们都在这里，只讨论电影相关电影迷们都在这里，只讨论电影相关电影迷们都在这里，只讨论电影相关电影迷们都在这里，只讨论电影相关电影迷们都在这里，只讨论电影相关电影迷们都在这里，只讨论电影相关电影迷们都在这里，只讨论电影相关电影迷们都在这里，只讨论电影相关电影迷们都在这里，只讨论电影相关电影迷们都在这里，只讨论电影相关电影迷们都在这里，只讨论电影相关电影迷们都在这里，只讨论电影相关电影迷们都在这里，只讨论电影相关" andHeight:100];
        T8MenuSection *section = [[T8MenuSection alloc] init];
        [section addMenuItem:item];
        [section addMenuItem:itemm];
        [section addMenuItem:textFieldItem];
        [section addMenuItem:textViewItem];
        [section addMenuItem:descItem];
        section.sectionEdgeInsets = UIEdgeInsetsMake(30, 0, 0, 0);
        [self.menuSections addObject:section];
        
        T8MenuDescriptionItem *he = [[T8MenuDescriptionItem alloc] initWithDescription:@"jhee"];
        UIImageView *customView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"female"]];
        customView1.frame = CGRectMake(0, 0, 100, 45);
        customView1.backgroundColor = [UIColor greenColor];
        self.custom1 = [[T8MenuTitleCustomViewItem alloc] initWithTitle:@"111111111111111111111111111111111111111111111111111111111111111111111" indicator:NO customView:customView1];
        UIImageView *customView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"female"]];
        T8MenuTitleCustomViewItem *custom2 = [[T8MenuTitleCustomViewItem alloc] initWithTitle:@"222222222222222222222222222222222222222222222222222222222222222222222222" indicator:YES customView:customView2];
        T8MenuSwitchItem *switchItem = [[T8MenuSwitchItem alloc] initWithTitle:@"评论" isOn:YES];
        T8MenuSection *section2 = [[T8MenuSection alloc] init];
        [section2 addMenuItem:he];
        [section2 addMenuItem:self.custom1];
        [section2 addMenuItem:custom2];
        [section2 addMenuItem:switchItem];
        section2.sectionEdgeInsets = UIEdgeInsetsMake(30, 0, 20, 0);
        [self.menuSections addObject:section2];
        
        T8MenuFunctionItem *func = [[T8MenuFunctionItem alloc] initWithFunctionTitle:@"log out"];
        T8MenuSection *section3 = [[T8MenuSection alloc] init];
        [section3 addMenuItem:func];
        [self.menuSections addObject:section3];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setRightBarButtonItemWithTitle:@"哈哈呵呵" target:self action:@selector(haha)];
    [self setLeftBarButtonItemWithTitle:@"哈哈呵呵" target:self action:@selector(haha)];
}

- (void)haha
{
    NSLog(@"haha...");
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(0, 0, 50, 30);
    self.custom1.customView = view;
    
    self.subTitleItem.subTitle = @"fwaefaw";
}

- (void)recieveMenuItemEvent:(NSString *)path item:(T8MenuItem *)item
{
    if ([path isEqualToString:MenuItemPathSwitch]) {
        T8MenuSwitchItem *switchItem = (T8MenuSwitchItem *)item;
        if ([switchItem isOn]) {
            NSLog(@"on...");
            [[T8CameraHelper sharedInstance] showVideoPickerViewControllerOnViewController:self compled:^(UIImage *image, NSDictionary *editingInfo) {
                
            }];
        }else{
            NSLog(@"off...");
        }
    }
}

@end
