//
//  T8Defines.h
//  Telegraph
//
//  Created by 琦张 on 15/2/8.
//
//

#ifndef Telegraph_T8Defines_h
#define Telegraph_T8Defines_h

// 单例模式
#undef	AS_SINGLETON
#define AS_SINGLETON( __class ) \
+ (__class *)sharedInstance;

#undef	DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[self alloc] init]; } ); \
return __singleton__; \
}

//屏幕宽度
#define SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
//屏幕高度
#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)
//iPhone 屏幕尺寸
#define PHONE_SCREEN_SIZE (CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - PHONE_STATUSBAR_HEIGHT))

#define UIColorRGB(rgb) ([[UIColor alloc] initWithRed:(((rgb >> 16) & 0xff) / 255.0f) green:(((rgb >> 8) & 0xff) / 255.0f) blue:(((rgb) & 0xff) / 255.0f) alpha:1.0f])
#define UIColorRGBA(rgb,a) ([[UIColor alloc] initWithRed:(((rgb >> 16) & 0xff) / 255.0f) green:(((rgb >> 8) & 0xff) / 255.0f) blue:(((rgb) & 0xff) / 255.0f) alpha:a])


//#if TARGET == 0 //  风利
//#ifndef AppMainColor
//#define AppMainColor                UIColorRGB(0x04C9BF)
//#endif
//#ifndef AppBgColor
//#define AppBgColor                  UIColorRGB(0xECECEC)
//#endif
//#ifndef NavBarBgColor
//#define NavBarBgColor               UIColorRGB(0xF9F9F9)
//#endif
//#ifndef MainContentColor
//#define MainContentColor            UIColorRGB(0x929292)
//#endif
//#ifndef TabBarColor
//#define TabBarColor                 UIColorRGB(0xF9F9F9)
//#endif
//#ifndef SeparatorColor
//#define SeparatorColor              UIColorRGB(0xE0E0E0)
//#endif
//#ifndef PlaceHolderColor
//#define PlaceHolderColor      UIColorRGB(0xBBBBBB)
//#endif
//#elif TARGET == 1   //  新生大学
#ifndef AppMainColor
#define AppMainColor                UIColorRGB(0x2ABA66)
#endif
#ifndef AppBgColor
#define AppBgColor                  UIColorRGB(0xF7F7F7)
#endif
#ifndef NavBarBgColor
#define NavBarBgColor               UIColorRGB(0xFFFFFF)
#endif
#ifndef MainContentColor
#define MainContentColor            UIColorRGB(0x333333)
#endif
#ifndef TabBarColor
#define TabBarColor                 UIColorRGB(0xFEFEFE)
#endif
#ifndef SeparatorColor
#define SeparatorColor              UIColorRGB(0xD5D5D5)
#endif
#ifndef PlaceHolderColor
#define PlaceHolderColor      UIColorRGB(0xBBBBBB)
#endif
#ifndef CellHighlightedBgColor
#define CellHighlightedBgColor      UIColorRGB(0xE6E6E6)
#endif
//#endif

#endif
