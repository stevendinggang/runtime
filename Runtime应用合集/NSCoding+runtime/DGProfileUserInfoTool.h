//
//  DGProfileUserInfoTool.h
//  Runtime应用合集
//
//  Created by Steven on 2018/6/7.
//  Copyright © 2018 Steven. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DGUserInfoResultData;

@interface DGProfileUserInfoTool : NSObject
//储存账号
+ (void)saveUserInfor:(DGUserInfoResultData *)accout;

//读取帐号
+ (DGUserInfoResultData *)accout;

@end
