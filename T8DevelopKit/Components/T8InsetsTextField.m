//
//  T8InsetsTextField.m
//  Hearts
//
//  Created by 琦张 on 15/7/9.
//  Copyright (c) 2015年 T8. All rights reserved.
//

#import "T8InsetsTextField.h"

@implementation T8InsetsTextField

//控制文本所在的的位置，左右缩 10
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 15 , 0 );
}

//控制编辑文本时所在的位置，左右缩 10
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 15 , 0 );
}

@end
