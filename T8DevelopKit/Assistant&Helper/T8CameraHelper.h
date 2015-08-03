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

/**
 *  获取图片，从相机或者相册
 *
 *  @param viewController
 *  @param compled        
 */
- (void)showPickerViewControllerOnParentVC:(UIViewController *)viewController compled:(DidFinishTakeMediaCompledBlock)compled;

/**
 *  获取视频，从相机获取
 *
 *  @param viewController
 *  @param compled        
 */
- (void)showVideoPickerViewControllerOnViewController:(UIViewController *)viewController compled:(DidFinishTakeMediaCompledBlock)compled;

@end
