//
//  T8MenuSwitchCell.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/7/14.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuSwitchCell.h"

@implementation T8MenuSwitchCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.switchItem];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(leftMargin));
            make.centerY.equalTo(self);
            make.right.lessThanOrEqualTo(self.switchItem).offset(-10);
        }];
        [self.switchItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-15);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}

#pragma mark - getter
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = UIColorRGB(0x222222);
    }
    return _titleLabel;
}

- (UISwitch *)switchItem
{
    if (!_switchItem) {
        _switchItem = [[UISwitch alloc] init];
    }
    return _switchItem;
}

@end
