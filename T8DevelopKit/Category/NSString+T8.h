/************************************************************
 *  * EaseMob CONFIDENTIAL
 * __________________
 * Copyright (C) 2013-2014 EaseMob Technologies. All rights reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of EaseMob Technologies.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from EaseMob Technologies.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (T8)

- (BOOL)isChinese;

- (BOOL)hasChinese;

- (CGFloat)heightForSize:(CGSize)size font:(UIFont *)font;

//加密方法
- (NSString *)MD5;
- (NSString *)getMd5_16Bit_String;
- (NSString *)getMd5_32Bit_String;
- (NSString *)getSha1String;
- (NSString *)getSha256String;
- (NSString *)getSha384String;
- (NSString *)getSha512String;

@end
