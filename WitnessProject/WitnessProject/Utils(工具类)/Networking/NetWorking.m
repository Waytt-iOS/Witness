//
//  NetWorking.m
//  AFNetworking3.x封装
//
//  Created by zhaoke on 16/8/31.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "NetWorking.h"
@implementation NetWorking

static AFHTTPSessionManager *_sessionManager;
static NSMutableArray *_allSessionTask;

+ (void)initialize {
    _sessionManager = [AFHTTPSessionManager manager];
    _sessionManager.requestSerializer.timeoutInterval = 30.f;
    _sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    _sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/plain",@"text/javascript",@"text/xml",@"image/*", nil];
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
}
+ (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field {
    [_sessionManager.requestSerializer setValue:value forHTTPHeaderField:field];
}
+ (NSMutableArray *)allSessionTask {
    if(!_allSessionTask) {
        _allSessionTask = [[NSMutableArray alloc] init];
    }
    return _allSessionTask;
}
+ (void)cancelAllRequest {
    @synchronized (self) {
        [[self allSessionTask] enumerateObjectsUsingBlock:^(NSURLSessionTask *_Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            [task cancel];
        }];
        [[self allSessionTask] removeAllObjects];
    }
}
+ (void)cancelRequestWithURL:(NSString *)url {
    if(!url) return;
    @synchronized (self) {
        [[self allSessionTask] enumerateObjectsUsingBlock:^(NSURLSessionTask *_Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            if([task.currentRequest.URL.absoluteString hasPrefix:url]) {
                [task cancel];
                [[self allSessionTask] removeObject:task];
                *stop = YES;
            }
        }];
    }
}
/**
 *  --  get 无缓存/自定义缓存方法
 */
+ (NSURLSessionTask *)getWithURL:(NSString *)URL paramaters:(NSDictionary *)parameters success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure {
    
    
    
    return [self getWithURL:[URL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] paramaters:parameters responseCache:nil success:success failure:failure];
}

+ (NSURLSessionTask *)getWithURL:(NSString *)URL paramaters:(NSDictionary *)parameters responseCache:(NetworkCache)responseCahce success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure {
    responseCahce ? responseCahce([NetWorkingCache getHttpCacheForURL:URL parameters:parameters]) : nil;
    NSURLSessionTask *sessionTask = [_sessionManager GET:URL parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
    
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[self allSessionTask] removeObject:task];
        success ? success(responseObject) : nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[self allSessionTask] removeObject:task];
        failure ? failure(error) : nil;
    }];
    sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil;
    return sessionTask;
}
/**
 *  --  post 无缓存/自定义缓存
 */
+ (NSURLSessionTask *)postWithURL:(NSString *)URL paramaters:(NSDictionary *)parameters success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure {
    return [self postWithURL:URL paramaters:parameters responseCache:nil success:success failure:failure];
}

+ (NSURLSessionTask *)postWithURL:(NSString *)URL paramaters:(NSDictionary *)parameters responseCache:(NetworkCache)responseCahce success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure {
    responseCahce ? responseCahce([NetWorkingCache getHttpCacheForURL:URL parameters:parameters]) : nil;
    NSURLSessionTask *sessionTask = [_sessionManager POST:URL parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[self allSessionTask] removeObject:task];
        success ? success(responseObject) : nil;
        responseCahce ? [NetWorkingCache setHttpCache:responseObject URL:URL parameters:parameters] : nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[self allSessionTask] removeObject:task];
        failure ? failure(error) : nil;
    }];
    sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil;
    return sessionTask;
}
/**
 *  --  上传图片
 */
+ (NSURLSessionTask *)uploadWithURL:(NSString *)URL parameters:(NSDictionary *)parameters images:(NSArray<UIImage *>*)images name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType progress:(NetworkingProgress)progress success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure {
    NSURLSessionTask *sessionTask = [_sessionManager POST:URL parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [images enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSData *imageData = UIImageJPEGRepresentation(obj, 0.5);
            [formData appendPartWithFileData:imageData name:name fileName:[NSString stringWithFormat:@"%@%lu.%@",fileName,idx,mimeType ? mimeType : @"jpeg"] mimeType:[NSString stringWithFormat:@"image/%@",mimeType ? mimeType : @"jpeg"]];
        }];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            progress ? progress(uploadProgress) : nil;
        });
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[self allSessionTask] removeObject:task];
        success ? success(responseObject) : nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[self allSessionTask] removeObject:task];
        failure ? failure(error) : nil;
    }];
    sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil;
    return sessionTask;
}
/**
 *  --  下载
 */
+ (NSURLSessionTask *)downloadWithURL:(NSString *)URL fileDir:(NSString *)fileDir progress:(NetworkingProgress)progress success:(void(^)(NSString *filePath))success failure:(NetworkResponseFailure)failure {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URL]];
    NSURLSessionDownloadTask *downloadTask = [_sessionManager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            progress ? progress(downloadProgress) : nil;
        });
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSString *downloadDir = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:fileDir ? fileDir : @"Download"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager createDirectoryAtPath:downloadDir withIntermediateDirectories:YES attributes:nil error:nil];
        NSString *filePath = [downloadDir stringByAppendingPathComponent:response.suggestedFilename];
        return [NSURL fileURLWithPath:filePath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        [[self allSessionTask] removeObject:downloadTask];
        if(failure && error){
            failure(error);
            return ;
        }
        success ? success(filePath.absoluteString) : nil;
    }];
    [downloadTask resume];
    downloadTask ? [[self allSessionTask] addObject:downloadTask] : nil;
    return downloadTask;
}
+ (NSString *)jsonToString:(id)data {
    if(!data) return nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}


@end
