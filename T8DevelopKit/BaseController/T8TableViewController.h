//
//  T8TableViewController.h
//  Hearts
//
//  Created by yewei on 15/6/16.
//  Copyright (c) 2015年 T8. All rights reserved.
//

#import "T8BaseViewController.h"

@interface T8TableViewController : T8BaseViewController
{
    UITableViewStyle _tableViewStyle;
    
@private
    BOOL _shouldLoadTableView;
}

@property (nonatomic) UITableViewStyle tableViewStyle;
@property (nonatomic, strong) UITableView *tableView;

- (id)initWithStyle:(UITableViewStyle)style;

/**
 * 下拉刷新需要执行的方法
 */
- (void)pullToRefreshAction;

/**
 * 重置下拉刷新状态
 */
- (void)stopRefreshAction;

/**
 * 上拉刷新需要执行得方法
 */
- (void)infiniteScrollingAction;

- (void)refreshTable;

@end
