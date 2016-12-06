//
//  T8TableViewController.m
//  Hearts
//
//  Created by yewei on 15/6/16.
//  Copyright (c) 2015年 T8. All rights reserved.
//

#import "T8TableViewController.h"
#import "SVPullToRefresh.h"
#import "T8Defines.h"

@interface T8TableViewController ()

@end

@implementation T8TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    if (self = [super init]) {
        _tableViewStyle = style;
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_shouldLoadTableView) {
        _shouldLoadTableView = NO;
        
        __weak typeof(self) weakSelf = self;
        // 添加下拉刷新功能
        if (self.showPullToRefresh) {
            [self.tableView addPullToRefreshWithActionHandler:^{
                [weakSelf performSelectorOnMainThread:@selector(pullToRefreshAction) withObject:nil waitUntilDone:YES];
            }];
        }
        
        // 添加无限下翻功能
        if (self.showInfiniteScrolling) {
            [self.tableView addInfiniteScrollingWithActionHandler:^{
                [weakSelf performSelectorOnMainThread:@selector(infiniteScrollingAction) withObject:nil waitUntilDone:YES];
            }];
            self.tableView.showsInfiniteScrolling = NO;
        }
        
        self.tableView.pullToRefreshView.originalTopInset = 64;
        [self.tableView.pullToRefreshView setTextColor:[UIColor colorWithRed:130.0/255.0 green:130.0/255.0 blue:130.0/255.0 alpha:1.0]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _shouldLoadTableView = YES;
    
    if (![self.view.subviews containsObject:self.tableView])
        [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.showPullToRefresh = NO;     // default is NO
    self.showInfiniteScrolling = NO; // default is NO
    self.tableView.separatorColor = SeparatorColor;
    
    self.currentPage = 1;
    self.limit = 12;
    self.timestamp = 0.0f;
}

- (UITableView *)tableView
{
    CGRect frame = self.view.bounds;
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:frame style:_tableViewStyle];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        UIView *view = [UIView new];
        _tableView.tableFooterView = view;
        
        if (_tableViewStyle == UITableViewStylePlain) {
            [_tableView setSeparatorInset:_separatorInset];
            [_tableView setLayoutMargins:_layoutMargins];
        }
        
        if ([_tableView respondsToSelector:@selector(setCellLayoutMarginsFollowReadableWidth:)]) {
            _tableView.cellLayoutMarginsFollowReadableWidth = NO;
        }
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Method

- (void)pullToRefreshAction
{
    
}

- (void)infiniteScrollingAction
{
    
}

- (void)stopRefreshAction
{
    [self.tableView.pullToRefreshView stopAnimating];
}

- (void)stopInfiniteAction
{
    [self.tableView.infiniteScrollingView stopAnimating];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *) __unused tableView
{
    return 0;
}

- (NSInteger)tableView:(UITableView *) __unused tableView numberOfRowsInSection:(NSInteger)__unused section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *) __unused tableView cellForRowAtIndexPath:(NSIndexPath *) __unused indexPath
{
    return nil;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:_separatorInset];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:_layoutMargins];
    }
}

@end
