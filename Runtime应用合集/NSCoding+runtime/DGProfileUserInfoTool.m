//
//  DGProfileUserInfoTool.m
//  Runtime应用合集
//
//  Created by Steven on 2018/6/7.
//  Copyright © 2018 Steven. All rights reserved.
//

//用户个人设置信息文件保存路径
#define FCPersonalImformationFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"personalImformation.data"]


#import "DGProfileUserInfoTool.h"
#import "DGUserInfoResultData.h"

@implementation DGProfileUserInfoTool

//归档
+ (void)saveUserInfor:(DGUserInfoResultData *)accout
{
    
    [NSKeyedArchiver archiveRootObject:accout toFile:FCPersonalImformationFilepath];
}

//读取账号(解档)
+ (DGUserInfoResultData *)accout;
{
    
    DGUserInfoResultData *perImforData = [NSKeyedUnarchiver unarchiveObjectWithFile:FCPersonalImformationFilepath];
    
    if (perImforData == nil) {
        
        perImforData = [[DGUserInfoResultData alloc] init];
    }
    return perImforData;
}


@end
