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

@interface T8MenuTableViewController : T8BaseViewController

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *menuSections;

@end
