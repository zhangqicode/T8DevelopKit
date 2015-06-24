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

@implementation TestMenuViewController

- (id)init
{
    self = [super init];
    if (self) {
        T8MenuTitleItem *item = [[T8MenuTitleItem alloc] initWithTitle:@"123"];
        T8MenuTextFieldItem *textFieldItem = [[T8MenuTextFieldItem alloc] initWithPlaceHolder:@"姓名"];
        T8MenuDescriptionItem *descItem = [[T8MenuDescriptionItem alloc] initWithDescription:@"群ID将用于群组的URL或搜索群组，群ID不可以于现有的重复fawefafweawefw"];
        T8MenuTextViewItem *textViewItem = [[T8MenuTextViewItem alloc] initWithPlaceHolder:@"电影迷们都在这里，只讨论电影相关" andHeight:100];
        NSMutableArray *items = [NSMutableArray arrayWithObject:item];
        [items addObject:textFieldItem];
        [items addObject:descItem];
        [items addObject:textViewItem];
        [self.menuSections addObject:items];
    }
    return self;
}

@end
