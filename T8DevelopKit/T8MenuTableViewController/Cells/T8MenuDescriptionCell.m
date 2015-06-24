//
//  T8MenuDescriptionCell.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/23.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuDescriptionCell.h"

@implementation T8MenuDescriptionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.descriptionLabel];
        
        [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(15, 20, 15, 20));
        }];
    }
    return self;
}

#pragma mark - getter
- (UILabel *)descriptionLabel
{
    if (!_descriptionLabel) {
        _descriptionLabel = [[UILabel alloc] init];
        _descriptionLabel.font = [UIFont systemFontOfSize:14];
        _descriptionLabel.textColor = UIColorRGB(0xa0a9ae);
        _descriptionLabel.numberOfLines = 0;
    }
    return _descriptionLabel;
}

@end
