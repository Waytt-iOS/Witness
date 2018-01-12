//
//  CLKey.m
//  iMei-New
//
//  Created by 广州投一电子商务有限公司 on 16/7/14.
//  Copyright © 2016年 WCL-Mac. All rights reserved.
//

#import "CLKey.h"
@implementation CLKey
+(BOOL)takeKeyStringUserInformation{
//        if (![CLUserDefaults takeObjectForKey:UserToKen]) {
//        return NO;
//    }else{
//        return YES;
//    }
    return YES;
}
+(NSString *)obtainUserToken{
    //获取 token
  
//    return [CLUserDefaults takeObjectForKey:UserToKen];
    return @"";
}
//toKen 加后缀
+(NSString *)authenticationToken{
   // NSLog(@"%@-%@-%@-%@=%@",[bookingTime getCurrentYears],[bookingTime getCurrentMonth],[bookingTime getCurrentDay],[bookingTime getCurrentwhen],[CLKey obtainUserToken]);
//    NSString *str = [NSString stringWithFormat:@"%@%@%@%@%@",[bookingTime getCurrentYears],[bookingTime getCurrentMonth],[bookingTime getCurrentDay],[bookingTime getCurrentwhen],[CLKey takeKeyStringUserPhone]];
//    //NSLog(@"%@",str);
//
//    NSString *md5 =[CLiOSMD5 md5:str];
//    NSString *token = [CLKey obtainUserToken];
//   // NSLog(@"token==%@",token);
//    NSString *sss = [NSString stringWithFormat:@"%@.%@",token,md5];
//   // NSLog(@"md5==%@",md5);
//    return sss;
    return @"";
}
//获取手机号
+(NSString *)takeKeyStringUserPhone{
//    return [CLUserDefaults takeObjectForKey:UserPhone];
    return @"";

}


@end
