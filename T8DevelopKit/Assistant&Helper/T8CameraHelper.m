//
//  T8CameraHelper.m
//  tinfinite
//
//  Created by yewei on 14/12/13.
//  Copyright (c) 2014年 Tinfinite. All rights reserved.
//

#import "T8CameraHelper.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface T8CameraHelper () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate>

@end

@implementation T8CameraHelper

DEF_SINGLETON(T8CameraHelper)

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc {
    self.didFinishTakeMediaCompled = nil;
}

- (void)showPickerViewControllerOnParentVC:(UIViewController *)viewController compled:(DidFinishTakeMediaCompledBlock)compled
{
    [self showPickerViewControllerOnParentVC:viewController needEdit:YES compled:compled];
}

- (void)showPickerViewControllerOnParentVC:(UIViewController *)viewController needEdit:(BOOL)edit compled:(DidFinishTakeMediaCompledBlock)compled
{
    self.didFinishTakeMediaCompled = [compled copy];
    self.parentVC = viewController;
    self.edit = edit;
    
    UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相机", @"相册", nil];
    [action showInView:self.parentVC.view];
}

- (void)showVideoPickerViewControllerOnViewController:(UIViewController *)viewController compled:(DidFinishTakeMediaCompledBlock)compled
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        compled(nil, nil);
        return;
    }
    
    self.didFinishTakeMediaCompled = [compled copy];
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [picker setVideoMaximumDuration:120.0f];
    [picker setVideoQuality:UIImagePickerControllerQualityType640x480];
    [picker setMediaTypes:@[(NSString *)kUTTypeMovie]];
    picker.delegate = self;
    [viewController presentViewController:picker animated:YES completion:nil];
}

- (void)showPickerViewControllerSourceType:(UIImagePickerControllerSourceType)sourceType onViewController:(UIViewController *)viewController compled:(DidFinishTakeMediaCompledBlock)compled {
    if (![UIImagePickerController isSourceTypeAvailable:sourceType]) {
        compled(nil, nil);
        return;
    }
    self.didFinishTakeMediaCompled = [compled copy];
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.allowsEditing = self.edit;
    imagePickerController.delegate = self;
    imagePickerController.sourceType = sourceType;
    [viewController presentViewController:imagePickerController animated:YES completion:NULL];
}

- (void)dismissPickerViewController:(UIImagePickerController *)picker {
    __weak typeof(self)  weakSelf = self;
    
    [picker dismissViewControllerAnimated:YES completion:^{
        weakSelf.didFinishTakeMediaCompled = nil;
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    if (self.didFinishTakeMediaCompled) {
        self.didFinishTakeMediaCompled(image, editingInfo);
    }
    [self dismissPickerViewController:picker];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    if (self.didFinishTakeMediaCompled) {
        self.didFinishTakeMediaCompled(nil, info);
    }
    [self dismissPickerViewController:picker];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissPickerViewController:picker];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if (buttonIndex == 0) {
        sourceType = UIImagePickerControllerSourceTypeCamera;
    }else if (buttonIndex == 1){
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }else{
        return;
    }
    
    [self showPickerViewControllerSourceType:sourceType onViewController:self.parentVC compled:self.didFinishTakeMediaCompled];
    self.parentVC = nil;
}

@end
