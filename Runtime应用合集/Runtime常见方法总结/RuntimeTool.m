//
//  RuntimeTool.m
//  Runtime应用合集
//
//  Created by Steven on 2018/6/7.
//  Copyright © 2018 Steven. All rights reserved.
//

#import "RuntimeTool.h"
#import <objc/runtime.h>

@implementation RuntimeTool

+ (NSString *)fetchClassName:(Class)class {
    const char *className = class_getName(class);
    return [NSString stringWithUTF8String:className];
}

+ (NSArray *)fetchIvarList:(Class)class {
    unsigned int count = 0;
    
    Ivar *ivarList = class_copyIvarList(class, &count);
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:2];
        const char *ivarName = ivar_getName(ivarList[i]);
        const char *ivarType = ivar_getTypeEncoding(ivarList[i]);
        dict[@"type"] = [NSString stringWithUTF8String:ivarType];
        dict[@"ivarName"] = [NSString stringWithUTF8String:ivarName];
        [mutableArray addObject:dict];
    }
    free(ivarList);
    return [NSArray arrayWithArray:mutableArray];
}

+ (NSArray *)fetchPropertyList:(Class)class {
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList(class, &count);
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        [mutableArray addObject:[NSString stringWithUTF8String:propertyName]];
    }
    free(propertyList);
    return [NSArray arrayWithArray:mutableArray];
}

+ (NSArray *)fetchMetodList:(Class)class {
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(class, &count);
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:count];
    
    for (unsigned int i = 0; i < count; i++) {
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        [mutableArray addObject:NSStringFromSelector(methodName)];
    }
    free(methodList);
    return [NSArray arrayWithArray:mutableArray];
}

+ (NSArray *)fetchProtocolList:(Class)class {
    unsigned int count = 0;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList(class, &count);
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++) {
        Protocol *protocol = protocolList[i];
        const char *protocolName = protocol_getName(protocol);
        [mutableArray addObject:[NSString stringWithUTF8String:protocolName]];
    }
    free(protocolList);
    return [NSArray arrayWithArray:mutableArray];
}

+ (void)addMethod:(Class)class method:(SEL)methodSel method:(SEL)methodSelImp {
    Method method = class_getInstanceMethod(class, methodSelImp);
    IMP methodIMP = method_getImplementation(method);
    const char *types = method_getTypeEncoding(method);
    class_addMethod(class, methodSel, methodIMP, types);
    
}

+ (void)methodSwap:(Class)class firstMethod:(SEL)methodA secondMethod:(SEL)methodB {
    Method first = class_getInstanceMethod(class, methodA);
    Method second = class_getInstanceMethod(class, methodB);
    method_exchangeImplementations(first, second);
}

@end
