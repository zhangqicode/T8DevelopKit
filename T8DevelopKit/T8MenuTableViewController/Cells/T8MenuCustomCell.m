//
//  T8MenuCustomCell.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 16/2/1.
//  Copyright © 2016年 琦张. All rights reserved.
//

#import "T8MenuCustomCell.h"

@implementation T8MenuCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

#pragma mark - setter
- (void)setCustomView:(UIView *)customView
{
    if (_customView) {
        [_customView removeFromSuperview];
    }
    
    _customView = customView;
    
    [self.contentView addSubview:_customView];
    
    [_customView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}

@end
