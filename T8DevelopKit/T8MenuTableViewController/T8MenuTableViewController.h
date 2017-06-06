//
//  UIMenuTableViewController.h
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/11.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "T8MenuSection.h"
#import "T8BaseViewController.h"
#import "T8MenuItem.h"

@interface T8MenuTableViewController : T8BaseViewController<UITableViewDataSource,UITableViewDelegate,T8MenuItemDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *menuSections;

@property (nonatomic, strong) UIColor *sectionHeaderColor;
@property (nonatomic, strong) UIColor *sectionFooterColor;

@property (nonatomic, assign) BOOL shouldCustomCellTopLineAndBottomLineDisplay;

//  是否关闭tableView高度自动布局，默认开启
@property (nonatomic, assign) BOOL disableAutoLayoutTableView;

@end
