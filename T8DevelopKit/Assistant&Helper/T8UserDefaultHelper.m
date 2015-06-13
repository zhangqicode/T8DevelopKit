//
//  T8UserDefaultHelper.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/13.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8UserDefaultHelper.h"
#import <objc/runtime.h>

@implementation T8UserDefaultHelper

- (id)init
{
    self = [super init];
    if (self) {
        
        unsigned int count;
        objc_property_t *properties = class_copyPropertyList([self class], &count);
        for (int i = 0; i < count; i++) {
            objc_property_t property = properties[i];
            NSString * key = [[NSString alloc]initWithCString:property_getName(property)  encoding:NSUTF8StringEncoding];
            id value = [[NSUserDefaults standardUserDefaults] objectForKey:[self getUserDefaultKeyWithPath:key]];
            if (value) {
                [self setValue:value forKey:key];
            }
            [self addObserver:self forKeyPath:key options:NSKeyValueObservingOptionNew context:nil];
        }
        
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    id value = [change objectForKey:@"new"];
    NSString *userDefaultKey = [self getUserDefaultKeyWithPath:keyPath];
    if (value && ![value isKindOfClass:[NSNull class]]) {
        [[NSUserDefaults standardUserDefaults] setObject:value forKey:userDefaultKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }else{
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:userDefaultKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (NSString *)getUserDefaultKeyWithPath:(NSString *)keyPath
{
    return [NSString stringWithFormat:@"T8UserDefaultKey_%@", keyPath];
}

@end
