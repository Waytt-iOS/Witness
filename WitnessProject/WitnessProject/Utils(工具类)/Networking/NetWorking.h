//
//  NetWorking.h
//  AFNetworking3.x封装
//
//  Created by zhaoke on 16/8/31.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkingCache.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"

/**
 * 网络状态
 */
typedef NS_ENUM(NSUInteger, NetworkingStatus) {
    NetworkingStatusUnknown,
    NetworkingStatusNotReachable,
    NetworkingStatusReachableViaWWAN,
    NetworkingStatusReachableViaWifi,
};
typedef NS_ENUM(NSUInteger, RequestSerializer) {
    RequestSerializerJSON,
    RequestSerializerHTTP,
};
typedef NS_ENUM(NSUInteger, ResponseSerializer) {
    ResponseSerializerJSON,
    ResponseSerializerHTTP,
    ResponseSerializerXML,
};
typedef void(^NetworkResponseSuccess)(id responseObject);
typedef void(^NetworkResponseFailure)(NSError *error);
// 缓存block
typedef void(^NetworkCache)(id responseCache);
// 进度block
typedef void(^NetworkingProgress)(NSProgress *progress);
typedef void(^NetworkingStatusBlock)(NetworkingStatus status);
/**
 *  缓存方式
 */
typedef NS_ENUM(NSUInteger, RequestCachePolicy) {
    RequestDontCacheData = 0, // 不缓存，直接请求
    RequestCacheDataThenLoad, // 有缓存先返回缓存，同步请求数据
    RequestIgnoreLocalCacheData, //忽略缓存，重新请求
    ReqeustCacheDataElseLoad,  // 有缓存就用缓存，没有重新请求
    ReqeustCacheDataElseDontLoad,  //有缓存就用缓存，没有也不发送请求
};

@interface NetWorking : NSObject
/**
 *  --  网络请求头设置
 */
+ (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field;
/**
 *  --  取消缓存
 */
+ (void)cancelAllRequest;
+ (void)cancelRequestWithURL:(NSString *)url;
/** 
 *  --  清除缓存数据
 */

/**
 *  --  get 无缓存/自定义缓存方法
 */
+ (NSURLSessionTask *)getWithURL:(NSString *)URL paramaters:(NSDictionary *)parameters success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure;

+ (NSURLSessionTask *)getWithURL:(NSString *)URL paramaters:(NSDictionary *)parameters responseCache:(NetworkCache)responseCahce success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure;
/**
 *  --  post 无缓存/自定义缓存
 */
+ (NSURLSessionTask *)postWithURL:(NSString *)URL paramaters:(NSDictionary *)parameters success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure;

+ (NSURLSessionTask *)postWithURL:(NSString *)URL paramaters:(NSDictionary *)parameters responseCache:(NetworkCache)responseCahce success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure;
/**
 *  --  上传图片
 */
+ (NSURLSessionTask *)uploadWithURL:(NSString *)URL parameters:(NSDictionary *)parameters images:(NSArray<UIImage *>*)images name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType progress:(NetworkingProgress)progress success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure;
/**
 *  --  下载
 */
+ (NSURLSessionTask *)downloadWithURL:(NSString *)URL fileDir:(NSString *)fileDir progress:(NetworkingProgress)progress success:(void(^)(NSString *filePath))success failure:(NetworkResponseFailure)failure;
//
////首页轮播图网络数据
//+(void)GetDataCarouselFigureSuccess:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure;
////首页热门项目
//+(void)GetHomeHotItemsSuccess:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure;
////获取城市ID
//+(void)GetCityID:(NSString *)cityName Success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure;
//
////获取账户余额
//+(void)GetAccountBalanceStatus:(NSString *)status Success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure;
//
////获取全部订单
//+(void)GetAllOrdersStatus:(NSString *)status Str_tyep:(NSString *)str_type Success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure;
////确认完成服务
//+(void)GetConfirmCompleteServiceorder_sn:(NSString *)order_sn Success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure;
////取消订单
//+(void)GetCancellationOfOrder_sn:(NSString *)order_sn Success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure;
////项目详情收藏接口
//+(void)GetEditTheCollectionProjectID:(NSString *)id Edit:(NSString *)edit Success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure;
////获取项目详情
//+(void)GetObtainProjectDetailsProjectID:(NSString *)projectID Success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure;
////获取会员卡列表接口
//+(void)GetmembershipCardPage_no:(NSString *)page_no Success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure;
////获取会员卡详情
//+(void)GetmembershipCardDetailsShopID:(NSString *)shop_id Page_no:(NSString *)page_no Success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure;
////划扣套餐或者项目接口
//+(void)GetmemDrawTheInterfaceShop_ID:(NSString *)shop_ID Service_time:(NSString *)service_time Project_id:(NSString *)project_id Meal_id:(NSString *)meal_id Success:(NetworkResponseSuccess)success failure:(NetworkResponseFailure)failure;



@end

