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

@property (nonatomic, assign) BOOL showPullToRefresh;
@property (nonatomic, assign) BOOL showInfiniteScrolling;

@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger limit;
@property (nonatomic, assign) NSTimeInterval timestamp;

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

/**
 *  重置上拉滚动状态
 */
- (void)stopInfiniteAction;


@end
