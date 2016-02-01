//
//  T8MenuCustomItem.h
//  T8DevelopKitDemo
//
//  Created by 琦张 on 16/2/1.
//  Copyright © 2016年 琦张. All rights reserved.
//

#import "T8MenuItem.h"

static NSString *const T8MenuCustomViewItemTap = @"T8MenuCustomViewItemTap";

@interface T8MenuCustomItem : T8MenuItem

@property (nonatomic) CGFloat customHeight;
@property (nonatomic) UIView *customView;

- (id)initWithCustomView:(UIView *)customView height:(CGFloat)height;

@end
