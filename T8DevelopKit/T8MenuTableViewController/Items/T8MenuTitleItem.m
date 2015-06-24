//
//  T8MenuTitleItem.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/19.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuTitleItem.h"
#import "T8MenuTitleCell.h"

@implementation T8MenuTitleItem

- (id)initWithTitle:(NSString *)title
{
    return [self initWithTitle:title indicator:NO];
}

- (id)initWithTitle:(NSString *)title indicator:(BOOL)indicator
{
    self = [super init];
    if (self) {
        self.cell = [[T8MenuTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        ((T8MenuTitleCell *)self.cell).titleLabel.text = title;
        if (indicator) {
            self.cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    return self;
}

- (CGFloat)itemHeight
{
    return 45;
}

@end
