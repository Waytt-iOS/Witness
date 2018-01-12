//
//  NetWorkingCache.h
//  AFNetworking3.x封装
//
//  Created by zhaoke on 16/8/31.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYCache.h"

@interface NetWorkingCache : NSObject

+ (void)setHttpCache:(id)httpData URL:(NSString *)URL parameters:(NSDictionary *)parameters;
+ (id)getHttpCacheForURL:(NSString *)URL parameters:(NSDictionary *)parameters;
+ (NSInteger)getAllHttpCacheSize;
+ (void)removeAllHttpCache;

@end
