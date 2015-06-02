//
//  NSMutableDictionary+Ext.m
//  Tinfinite
//
//  Created by yewei on 14/11/21.
//  Copyright (c) 2014年 Tinfinite. All rights reserved.
//

#import "NSMutableDictionary+T8.h"

@implementation NSMutableDictionary (T8)

- (void)addObject:(id)object forKey:(NSString *)keyValue
{
    if (object != nil && ![object isEqual:[NSNull null]] && object != NULL) {
        [self setObject:object forKey:keyValue];
    }
}

@end
