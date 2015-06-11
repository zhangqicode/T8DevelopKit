//
//  T8CameraHelper.h
//  tinfinite
//
//  Created by yewei on 14/12/13.
//  Copyright (c) 2014年 Tinfinite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "T8Defines.h"

typedef void(^DidFinishTakeMediaCompledBlock)(UIImage *image, NSDictionary *editingInfo);

@interface T8CameraHelper : NSObject

AS_SINGLETON(T8CameraHelper)

- (void)showPickerViewControllerOnParentVC:(UIViewController *)viewController compled:(DidFinishTakeMediaCompledBlock)compled;

@end
