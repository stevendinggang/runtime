//
//  RuntimeTool.h
//  Runtime应用合集
//
//  Created by Steven on 2018/6/7.
//  Copyright © 2018 Steven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuntimeTool : NSObject

/**
 获取类名
 @param class 类
 @return 类名
 */
+ (NSString *)fetchClassName:(Class)class;
/**
 获取成员变量
 @param class class
 @return NSArray
 */
+ (NSArray *)fetchIvarList:(Class)class;
/**
 获取成员属性
 @param class  class
 @return NSArray
 */
+ (NSArray *)fetchPropertyList:(Class)class;
/**
 获取实例方法
 @param class  class
 @return NSArray
 */
+ (NSArray *)fetchMetodList:(Class)class;
/**
 获取协议列表
 @param class class
 @return NSArray
 */
+ (NSArray *)fetchProtocolList:(Class)class;
/**
 动态添加方法
 @param class  class
 @param methodSel 方法名
 @param methodSelImp 对应方法的实现方法名称
 */
+ (void)addMethod:(Class)class method:(SEL)methodSel method:(SEL)methodSelImp;
/**
 交换方法
 @param class class
 @param methodA 方法1
 @param methodB 方法2
 */
+ (void)methodSwap:(Class)class firstMethod:(SEL)methodA secondMethod:(SEL)methodB;

@end
