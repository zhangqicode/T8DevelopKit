//
//  UIMenuCell.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/19.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuCell.h"

@implementation T8MenuCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
        self.selectedBackgroundView.backgroundColor = CellHighlightedBgColor;
        
        [self addSubview:self.topLine];
        [self addSubview:self.bottomLine];
        
        [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.height.equalTo(@0.3);
        }];
        [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.height.equalTo(@0.5);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)showTopLine:(BOOL)top bottomLine:(BOOL)bottom
{
    self.topLine.hidden = !top;
    self.bottomLine.hidden = !bottom;
}

#pragma mark - getter
- (UIImageView *)topLine
{
    if (!_topLine) {
        _topLine = [[UIImageView alloc] init];
        _topLine.backgroundColor = SeparatorColor;
        _topLine.hidden = YES;
    }
    return _topLine;
}

- (UIImageView *)bottomLine
{
    if (!_bottomLine) {
        _bottomLine = [[UIImageView alloc] init];
        _bottomLine.backgroundColor = SeparatorColor;
        _bottomLine.hidden = YES;
    }
    return _bottomLine;
}

@end
