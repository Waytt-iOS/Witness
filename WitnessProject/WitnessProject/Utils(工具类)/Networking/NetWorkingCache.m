//
//  NetWorkingCache.m
//  AFNetworking3.x封装
//
//  Created by zhaoke on 16/8/31.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "NetWorkingCache.h"


@implementation NetWorkingCache

static NSString *const NetworkResponseCache = @"NetworkResponseCache";
static YYCache *_dataCache;

+ (void)initialize {
    _dataCache = [[YYCache alloc] initWithName:NetworkResponseCache];
}
+ (void)setHttpCache:(id)httpData URL:(NSString *)URL parameters:(NSDictionary *)parameters {
    NSString *cacheKey = [self cacheKeyWithURLString:URL parameters:parameters];
    [_dataCache setObject:httpData forKey:cacheKey withBlock:nil];
}
+ (id)getHttpCacheForURL:(NSString *)URL parameters:(NSDictionary *)parameters {
    NSString *cacheKey = [self cacheKeyWithURLString:URL parameters:parameters];
    return [_dataCache objectForKey:cacheKey];
}
+ (NSInteger)getAllHttpCacheSize {
    return [_dataCache.diskCache totalCost];
}
+ (void)removeAllHttpCache {
    [_dataCache.diskCache removeAllObjects];
}
+ (NSString *)cacheKeyWithURLString:(NSString *)URL parameters:(NSDictionary *)parameters {
    NSString *cacheKey = [NSString stringWithFormat:@"%@",URL];
    if (parameters) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
        NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        cacheKey = [NSString stringWithFormat:@"%@%@",cacheKey,jsonStr];
    }
    return cacheKey;
}
@end
