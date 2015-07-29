//
//  T8AvatarAndTitleCell.m
//  Hearts
//
//  Created by 琦张 on 15/7/7.
//  Copyright (c) 2015年 T8. All rights reserved.
//

#import "T8AvatarAndTitleCell.h"

@implementation T8AvatarAndTitleCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.avatarView];
        [self.contentView addSubview:self.titleLabel];
        
        [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@15);
            make.centerY.equalTo(self);
            make.width.equalTo(@38);
            make.height.equalTo(@38);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.avatarView.mas_right).offset(11);
            make.right.equalTo(self).offset(-10);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}

#pragma mark - getter
- (UIImageView *)avatarView
{
    if (!_avatarView) {
        _avatarView = [[UIImageView alloc] init];
        _avatarView.layer.cornerRadius = 19;
        _avatarView.layer.masksToBounds = YES;
    }
    return _avatarView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = UIColorRGB(0x404040);
    }
    return _titleLabel;
}

@end
