//
//  CLUserDefaults.m
//  iMei-New
//
//  Created by WangChaoLong on 16/6/21.
//  Copyright © 2016年 WCL-Mac. All rights reserved.
//

#import "CLUserDefaults.h"
@implementation CLUserDefaults
+(void)saveValue:(NSString *)value Key:(NSString *)key{
    NSUserDefaults *save = [NSUserDefaults standardUserDefaults];
    [save setValue:value forKey:key];
    [save synchronize];
}
+(NSString *)takeObjectForKey:(NSString *)key{
    NSUserDefaults *take = [NSUserDefaults standardUserDefaults];
    return [take objectForKey:key];
}
+(void)saveValueImageView:(NSData *)image Key:(NSString *)key{
    NSUserDefaults *save = [NSUserDefaults standardUserDefaults];
    [save setValue:image forKey:key];
    [save synchronize];
    
}
+(NSData *)takeObjectImageViewForKey:(NSString *)key{
    NSUserDefaults *take = [NSUserDefaults standardUserDefaults];
    return [take objectForKey:key];

}
+(void)saveValueArray:(NSMutableArray *)array Key:(NSString *)key{
    NSUserDefaults *save = [NSUserDefaults standardUserDefaults];
    [save setValue:array forKey:key];
    [save synchronize];
}
+(NSMutableArray *)takeObjectArrayForKey:(NSString *)key{
    NSUserDefaults *take = [NSUserDefaults standardUserDefaults];
    return [take objectForKey:key];
}

+(void)deleteTheDataKey:(NSString *)key{
[[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)saveValueDic:(NSDictionary
                     *) dic Key:(NSString *)key{
    NSUserDefaults *save = [NSUserDefaults standardUserDefaults];
    [save setValue:dic forKey:key];
    [save synchronize];
}
+(NSDictionary *)takeObjectDicForKey:(NSString *)key{
    NSUserDefaults *take = [NSUserDefaults standardUserDefaults];
    return [take objectForKey:key];
}

@end
