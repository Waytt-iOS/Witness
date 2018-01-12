//
//  CLUserDefaults.h
//  iMei-New
//
//  Created by WangChaoLong on 16/6/21.
//  Copyright © 2016年 WCL-Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLUserDefaults : NSUserDefaults


+(void)saveValue:(NSString *)value Key:(NSString *)key;
+(NSString *)takeObjectForKey:(NSString *)key;
+(void)saveValueImageView:(NSData *)image Key:(NSString *)key;
+(NSData *)takeObjectImageViewForKey:(NSString *)key;
+(void)saveValueArray:(NSMutableArray *)array Key:(NSString *)key;
+(NSMutableArray *)takeObjectArrayForKey:(NSString *)key;
+(void)deleteTheDataKey:(NSString *)key;
+(void)saveValueDic:(NSDictionary
                     *) dic Key:(NSString *)key;
+(NSDictionary *)takeObjectDicForKey:(NSString *)key;
@end
