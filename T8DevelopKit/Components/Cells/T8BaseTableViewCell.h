//
//  BaseTableViewCell.h
//  DaQuan
//
//  Created by yewei on 15/5/27.
//  Copyright (c) 2015年 Think. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "T8Defines.h"

@interface T8BaseTableViewCell : UITableViewCell
{
    id _object;
}

@property (nonatomic, strong) id		object;
@property (nonatomic, copy) NSIndexPath *indexPath;

+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id)object;

//object属性observer相关
/*开始监听object属性,在subclass中通过该方法可自定义添加监听的属性*/
- (void)startObserveObjectProperty;
/*清除监听,在subclass中应该清除已添加的属性*/
- (void)finishObserveObjectProperty;

/*监听一个属性*/
- (void)addObservedProperty:(NSString *)property;
/*移出监听*/
- (void)removeObservedProperty:(NSString *)property;
/*属性发生变动的回调*/
- (void)objectPropertyChanged:(NSString *)property;

@end
