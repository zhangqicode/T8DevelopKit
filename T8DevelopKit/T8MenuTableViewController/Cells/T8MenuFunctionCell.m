//
//  T8MenuFunctionCell.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/7/6.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuFunctionCell.h"

@implementation T8MenuFunctionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.titleLabel];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.greaterThanOrEqualTo(self.contentView).offset(leftMargin);
            make.right.lessThanOrEqualTo(self.contentView).offset(-20);
            make.centerX.equalTo(self.contentView);
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
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = UIColorRGB(0xe94600);
    }
    return _titleLabel;
}

@end
