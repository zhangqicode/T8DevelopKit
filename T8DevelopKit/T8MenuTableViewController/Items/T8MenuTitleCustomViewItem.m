//
//  T8MenuTitleCustomViewItem.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/7/1.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuTitleCustomViewItem.h"
#import "T8MenuTitleCustomViewCell.h"

@implementation T8MenuTitleCustomViewItem

- (id)initWithTitle:(NSString *)title indicator:(BOOL)indicator customView:(UIView *)customView
{
    self = [super init];
    if (self) {
        self.cell = [[T8MenuTitleCustomViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        self.cell.selectedBackgroundView = [[UIView alloc] initWithFrame:self.cell.frame];
        self.cell.selectedBackgroundView.backgroundColor = CellHighlightedBgColor;
        T8MenuTitleCustomViewCell *cell = (T8MenuTitleCustomViewCell *)self.cell;
        cell.titleLabel.text = title;
        if (indicator) {
            UIView *accesoryView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
            UIImageView *accesoryImageView = [[UIImageView alloc]init];
            [accesoryImageView setImage:[UIImage imageNamed:@"public_ic_details"]];
            [accesoryView addSubview:accesoryImageView];
            [accesoryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(accesoryView);
                make.left.equalTo(accesoryView).offset(6);
                make.width.equalTo(@18);
                make.height.equalTo(@18);
            }];
            self.cell.accessoryView = accesoryView;

        }
        [self setCustomView:customView];
    }
    return self;
}

- (CGFloat)itemHeight
{
    return 45;
}

- (void)cellTapped:(UITapGestureRecognizer *)gesture
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(recieveMenuItemEvent:item:)]) {
        [self.delegate recieveMenuItemEvent:T8MenuTitleCustomViewItemTap item:self];
    }
}

#pragma mark - getter
- (UIView *)customView
{
    return ((T8MenuTitleCustomViewCell *)self.cell).customView;
}

#pragma mark - setter
- (void)setCustomView:(UIView *)customView
{
    T8MenuTitleCustomViewCell *cell = (T8MenuTitleCustomViewCell *)self.cell;
    cell.customView = customView;
    if (cell.accessoryView) {
        [cell.customView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.cell.contentView);
            make.centerY.equalTo(self.cell.contentView);
            make.left.greaterThanOrEqualTo(cell.titleLabel.mas_right).offset(20);
        }];
    }else{
        [cell.customView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.cell.contentView).offset(-20);
            make.centerY.equalTo(self.cell.contentView);
            make.left.greaterThanOrEqualTo(cell.titleLabel.mas_right).offset(20);
        }];
    }
    if (customView.frame.size.width!=0) {
        [cell.customView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(customView.frame.size.width));
        }];
    }
    if (customView.frame.size.height!=0) {
        [cell.customView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(customView.frame.size.height));
        }];
    }
}

@end
