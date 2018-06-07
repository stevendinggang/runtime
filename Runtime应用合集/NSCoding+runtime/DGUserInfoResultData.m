//
//  DGUserInfoResultData.m
//  Runtime应用合集
//
//  Created by Steven on 2018/6/7.
//  Copyright © 2018 Steven. All rights reserved.
//

#import "DGUserInfoResultData.h"
#import <objc/runtime.h>

@implementation DGUserInfoResultData


//普通归档接档

//- (void)encodeWithCoder:(NSCoder *)encoder     //归档
//{
//    [encoder encodeObject:obj1 forKey:@"obj1Key"];
//    [encoder encodeInt:anInt forKey:@"IntValueKey"];
//    [encoder encodeFloat:aFloat forKey:@"FloatValueKey"];
//}
//-(instancetype)initWithCoder:(NSCoder *)decoder // 解档
//{
//    if (!(self = [super init]))
//        return nil;
//    obj1 = [decoder decodeObjectForKey:@"obj1Key"];
//    anInt = [decoder decodeObjectForKey:@"IntValueKey"];
//    aFloat = [decoder decodeObjectForKey:@"FloatValueKey"];
//}

-(void)encodeWithCoder:(NSCoder *)encoder{
    
    unsigned int count = 0;
    //取出Person这个对象的所有属性
    Ivar *ivars = class_copyIvarList([DGUserInfoResultData class], &count);
    //对所有属性进行遍历
    for (int i = 0; i<count; i++) {
        // 取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        // 查看成员变量
        const char *name = ivar_getName(ivar);
        // 归档
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [encoder encodeObject:value forKey:key];
        
    }
    free(ivars);
}

-(id)initWithCoder:(NSCoder *)decoder{
    
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([DGUserInfoResultData class], &count);
        for (int i = 0; i<count; i++) {
            // 取出i位置对应的成员变量
            Ivar ivar = ivars[i];
            // 查看成员变量
            const char *name = ivar_getName(ivar);
            // 归档
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [decoder decodeObjectForKey:key];
            // 必须进行非空判断, 不然改代码会crash
            if (value) {
                // 设置到成员变量身上
                [self setValue:value forKey:key];
            }
        }
        free(ivars);
    }
    return self;
}
/*
 个人觉得用runtime动态归档与反归档要比直接用OC代码写要简单方便很多,省时又省力.
 */


@end
