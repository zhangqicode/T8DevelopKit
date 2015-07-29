//
//  BaseTableViewCell.m
//  DaQuan
//
//  Created by yewei on 15/5/27.
//  Copyright (c) 2015年 Think. All rights reserved.
//

#import "T8BaseTableViewCell.h"

@implementation T8BaseTableViewCell

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    return 44;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)identifier
{
    if (self = [super initWithStyle:style reuseIdentifier:identifier])
    {
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

- (void)setObject:(id)object
{
    if (object != _object) {
        if (_object != nil) {
            [self finishObserveObjectProperty];
        }
        
        _object = object;
        if (_object != nil)
            [self startObserveObjectProperty];
    }
}

#pragma mark Object Property Observer

- (void)startObserveObjectProperty {
    
}

- (void)finishObserveObjectProperty {
    
}

- (void)addObservedProperty:(NSString *)property {
    [_object addObserver:self forKeyPath:property
                 options:NSKeyValueObservingOptionNew
                 context:nil];
}

- (void)removeObservedProperty:(NSString *)property {
    [_object removeObserver:self forKeyPath:property];
}

- (void)objectPropertyChanged:(NSString *)property {
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object != _object) {
        [object removeObserver:self forKeyPath:keyPath];
    }
    else {
        [self objectPropertyChanged:keyPath];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
