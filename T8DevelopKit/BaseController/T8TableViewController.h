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
}

@property (nonatomic) UITableViewStyle tableViewStyle;
@property (nonatomic, strong) UITableView *tableView;

- (id)initWithStyle:(UITableViewStyle)style;

@end
