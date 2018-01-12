//
//  CLKey.h
//  iMei-New
//
//  Created by 广州投一电子商务有限公司 on 16/7/14.
//  Copyright © 2016年 WCL-Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface CLKey : NSObject
//判断用户是否登录
+(BOOL)takeKeyStringUserInformation;
//获取token
+(NSString *)obtainUserToken;
//添加后缀的token
+(NSString *)authenticationToken;
//获取用户手机号
+(NSString *)takeKeyStringUserPhone;
@end
