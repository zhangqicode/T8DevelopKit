//
//  T8ATBCell.m
//  Hearts
//
//  Created by 琦张 on 15/7/12.
//  Copyright (c) 2015年 T8. All rights reserved.
//

#import "T8ATBCell.h"

@implementation T8ATBCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.funcBtn];
        
        [self.funcBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-10);
            make.centerY.equalTo(self);
            make.width.equalTo(@52);
            make.height.equalTo(@30);
        }];
    }
    return self;
}

- (void)funcBtnPressed
{
    
}

#pragma mark - getter
- (UIButton *)funcBtn
{
    if (!_funcBtn) {
        _funcBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _funcBtn.backgroundColor = UIColorRGB(0xa0a9ae);
        _funcBtn.layer.cornerRadius = 3;
        _funcBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_funcBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_funcBtn addTarget:self action:@selector(funcBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    }
    return _funcBtn;
}

@end
