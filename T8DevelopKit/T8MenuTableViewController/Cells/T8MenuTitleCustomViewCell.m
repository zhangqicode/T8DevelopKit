//
//  T8MenuTitleCustomViewCell.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/7/1.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuTitleCustomViewCell.h"

@implementation T8MenuTitleCustomViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(leftMargin);
            make.centerY.equalTo(self.contentView);
        }];
    }
    return self;
}

#pragma mark - getter
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = UIColorRGB(0x222222);
    }
    return _titleLabel;
}

#pragma mark - setter
- (void)setCustomView:(UIView *)customView
{
    if (_customView) {
        [_customView removeFromSuperview];
    }
    
    _customView = customView;
    
    [self.contentView addSubview:_customView];
}

@end
