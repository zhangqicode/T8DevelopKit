//
//  UIView+T8.h
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/1.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (T8)

/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
@property (nonatomic) CGFloat left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat centerY;

/**
 * Return the x coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat screenX;

/**
 * Return the y coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat screenY;

/**
 * Return the x coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewX;

/**
 * Return the y coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewY;

/**
 * Return the view frame on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGRect screenFrame;

/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize size;

/**
 * Return the width in portrait or the height in landscape.
 */
@property (nonatomic, readonly) CGFloat orientationWidth;

/**
 * Return the height in portrait or the width in landscape.
 */
@property (nonatomic, readonly) CGFloat orientationHeight;

//@property(nonatomic,readonly) CGFloat orientationWidth;
//@property(nonatomic,readonly) CGFloat orientationHeight;

- (UIScrollView*)findFirstScrollView;

- (UIView*)firstViewOfClass:(Class)cls;

- (UIView*)firstParentOfClass:(Class)cls;

- (UIView*)findChildWithDescendant:(UIView*)descendant;

/**
 * Removes all subviews.
 */
- (void)removeSubviews;

/**
 * WARNING: This depends on undocumented APIs and may be fragile.  For testing only.
 */
//- (void)simulateTapAtPoint:(CGPoint)location;

- (CGPoint)offsetFromView:(UIView*)otherView;

// 截屏
- (UIImage *)snapshot;

/* Create your borders and assign them to a property on a view when you can via the create methods when possible. Otherwise you might end up with multiple borders being created.
 */

///------------
/// Top Border
///------------
-(CALayer*)createTopBorderWithHeight: (CGFloat)height andColor:(UIColor*)color;
-(UIView*)createViewBackedTopBorderWithHeight: (CGFloat)height andColor:(UIColor*)color;
-(void)addTopBorderWithHeight:(CGFloat)height andColor:(UIColor*)color;
-(void)addViewBackedTopBorderWithHeight:(CGFloat)height andColor:(UIColor*)color;


///------------
/// Top Border + Offsets
///------------

-(CALayer*)createTopBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andTopOffset:(CGFloat)topOffset;
-(UIView*)createViewBackedTopBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andTopOffset:(CGFloat)topOffset;
-(void)addTopBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andTopOffset:(CGFloat)topOffset;
-(void)addViewBackedTopBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andTopOffset:(CGFloat)topOffset;

///------------
/// Right Border
///------------

-(CALayer*)createRightBorderWithWidth: (CGFloat)width andColor:(UIColor*)color;
-(UIView*)createViewBackedRightBorderWithWidth: (CGFloat)width andColor:(UIColor*)color;
-(void)addRightBorderWithWidth: (CGFloat)width andColor:(UIColor*)color;
-(void)addViewBackedRightBorderWithWidth: (CGFloat)width andColor:(UIColor*)color;

///------------
/// Right Border + Offsets
///------------

-(CALayer*)createRightBorderWithWidth: (CGFloat)width color:(UIColor*)color rightOffset:(CGFloat)rightOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset;
-(UIView*)createViewBackedRightBorderWithWidth: (CGFloat)width color:(UIColor*)color rightOffset:(CGFloat)rightOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset;
-(void)addRightBorderWithWidth: (CGFloat)width color:(UIColor*)color rightOffset:(CGFloat)rightOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset;
-(void)addViewBackedRightBorderWithWidth: (CGFloat)width color:(UIColor*)color rightOffset:(CGFloat)rightOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset;

///------------
/// Bottom Border
///------------

-(CALayer*)createBottomBorderWithHeight: (CGFloat)height andColor:(UIColor*)color;
-(UIView*)createViewBackedBottomBorderWithHeight: (CGFloat)height andColor:(UIColor*)color;
-(void)addBottomBorderWithHeight:(CGFloat)height andColor:(UIColor*)color;
-(void)addViewBackedBottomBorderWithHeight:(CGFloat)height andColor:(UIColor*)color;

///------------
/// Bottom Border + Offsets
///------------

-(CALayer*)createBottomBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andBottomOffset:(CGFloat)bottomOffset;
-(UIView*)createViewBackedBottomBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andBottomOffset:(CGFloat)bottomOffset;
-(void)addBottomBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andBottomOffset:(CGFloat)bottomOffset;
-(void)addViewBackedBottomBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andBottomOffset:(CGFloat)bottomOffset;

///------------
/// Left Border
///------------

-(CALayer*)createLeftBorderWithWidth: (CGFloat)width andColor:(UIColor*)color;
-(UIView*)createViewBackedLeftBorderWithWidth: (CGFloat)width andColor:(UIColor*)color;
-(void)addLeftBorderWithWidth: (CGFloat)width andColor:(UIColor*)color;
-(void)addViewBackedLeftBorderWithWidth: (CGFloat)width andColor:(UIColor*)color;

///------------
/// Left Border + Offsets
///------------

-(CALayer*)createLeftBorderWithWidth: (CGFloat)width color:(UIColor*)color leftOffset:(CGFloat)leftOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset;
-(UIView*)createViewBackedLeftBorderWithWidth: (CGFloat)width color:(UIColor*)color leftOffset:(CGFloat)leftOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset;
-(void)addLeftBorderWithWidth: (CGFloat)width color:(UIColor*)color leftOffset:(CGFloat)leftOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset;
-(void)addViewBackedLeftBorderWithWidth: (CGFloat)width color:(UIColor*)color leftOffset:(CGFloat)leftOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset;


@end
