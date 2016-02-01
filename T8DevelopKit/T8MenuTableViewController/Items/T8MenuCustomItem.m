//
//  T8MenuCustomItem.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 16/2/1.
//  Copyright © 2016年 琦张. All rights reserved.
//

#import "T8MenuCustomItem.h"
#import "T8MenuCustomCell.h"

@implementation T8MenuCustomItem

- (id)initWithCustomView:(UIView *)customView height:(CGFloat)height
{
    self = [super init];
    if (self) {
        self.customView = customView;
        self.customHeight = height;
        
        self.cell = [[T8MenuCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        T8MenuCustomCell *cell = (T8MenuCustomCell *)self.cell;
        cell.customView = customView;
    }
    return self;
}

- (CGFloat)itemHeight
{
    return self.customHeight;
}

- (void)cellTapped:(UITapGestureRecognizer *)gesture
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(recieveMenuItemEvent:item:)]) {
        [self.delegate recieveMenuItemEvent:T8MenuCustomViewItemTap item:self];
    }
}

#pragma mark - getter
- (UIView *)customView
{
    return ((T8MenuCustomCell *)self.cell).customView;
}

@end
