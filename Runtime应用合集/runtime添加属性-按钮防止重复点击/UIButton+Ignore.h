//
//  UIButton+Ignore.h
//  Runtime应用合集
//
//  Created by Steven on 2018/6/7.
//  Copyright © 2018 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>

#define defaultInterval .5f  //默认时间间隔

@interface UIButton (Ignore)

/**设置点击时间间隔*/
@property (nonatomic, assign) NSTimeInterval timeInterval;
/**
 *  用于设置单个按钮不需要被hook
 */
@property (nonatomic, assign) BOOL isOpen;

@end
