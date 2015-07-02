//
//  T8TableViewController.m
//  Hearts
//
//  Created by yewei on 15/6/16.
//  Copyright (c) 2015年 T8. All rights reserved.
//

#import "T8TableViewController.h"

@interface T8TableViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation T8TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    if (self = [super init]) {
        _tableViewStyle = style;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (![self.view.subviews containsObject:self.tableView])
        [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
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
            if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
                [_tableView setSeparatorInset:UIEdgeInsetsZero];
            }
            if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
                [_tableView setLayoutMargins:UIEdgeInsetsZero];
            }
        }
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end
