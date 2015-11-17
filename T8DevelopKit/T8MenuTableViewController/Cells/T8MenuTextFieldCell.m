//
//  T8MenuTextFieldCell.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/23.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuTextFieldCell.h"

@implementation T8MenuTextFieldCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.textField];
        
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, leftMargin, 0, 20));
        }];
    }
    return self;
}

#pragma mark - getter
- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.font = [UIFont systemFontOfSize:15];
        _textField.textColor = UIColorRGB(0x404040);
    }
    return _textField;
}

@end
