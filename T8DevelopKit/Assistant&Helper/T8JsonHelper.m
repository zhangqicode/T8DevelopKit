//
//  T8JsonHelper.m
//  tinfinite
//
//  Created by yewei on 14/12/9.
//  Copyright (c) 2014年 Tinfinite. All rights reserved.
//

#import "T8JsonHelper.h"

@implementation T8JsonHelper

+ (id)getObjectWithJsonString:(NSString *)jsonStr {
    NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    return [T8JsonHelper getObjectWithJsonData:data];
}

+ (NSString *)getJsonStringWithObject:(id)object {
    NSData *jsonData = [T8JsonHelper getJsonDataWithObject:object];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (id)getObjectWithJsonData:(NSData *)jsonData {
    if (!jsonData) {
        return nil;
    }
    id object = nil;
    NSError *error = nil;
    @try {
        object = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    } @catch (NSException *exception) {
        NSLog(@"%@",[exception description]);
    } @finally {
        if (error) {
            NSLog(@"%@",[error description]);
        }
    }
    return object;
}

+ (NSData *)getJsonDataWithObject:(id)object {
    NSData *jsonData = nil;
    NSError *error;
    @try {
        if ([NSJSONSerialization isValidJSONObject:object])
        {
            jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@",[exception description]);
    } @finally {
        if (error) {
            NSLog(@"%@",[error description]);
        }
    }
    return jsonData;
    
}

@end
