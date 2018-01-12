//
//  CLRequest.h
//  iMei-New
//
//  Created by 广州投一电子商务有限公司 on 16/7/14.
//  Copyright © 2016年 WCL-Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^CallBack)(id json);

@interface CLRequest : NSObject
+(void)getddByUrlPath:(NSString *)path andParams:(NSString *)params andCallBack:(CallBack)callback ;
+(void)postddByByUrlPath:(NSString *)path andParams:(NSDictionary*)params andCallBack:(CallBack)callback;
//生成订单
+(NSString *)generProject_ids:(NSArray *)array;
//获取项目订单号
+(void)generateOrdersProject_ids:(NSString *)project_id Shop_id:(NSString *)shop_id Name:(NSString *)name Mobile:(NSString *)mobile Total_price:(NSString *)total_price Discount_price:(NSString *)discount_price Cash_coupon_id:(NSString *)cash_coupon_id
                             Coupon_sn:(NSString *)coupon_sn Service_time:(NSString *)service_time Pay_method:(NSString *)pay_method Meal_id:(NSString *)meal_id Meal_name:(NSString *)meal_name Used_money:(NSString *)used_money Used_commission
                                      :(NSString *)used_commission andCallBack:(CallBack)callback;
//获取套餐订单号
+(void)AccessToPackageTheOrderNumberMeal_id:(NSString *)meal_id Total_price:(NSString *)total_price Cash_coupon_id
                                           :(NSString *)cash_coupon_id Coupon_sn
                                           :(NSString *)coupon_sn
                                 Pay_method:(NSString *)pay_method Used_money:(NSString *)used_money Used_commission
                                           :(NSString *)used_commission  Num:(NSString *)num andCallBack:(CallBack)callback;


+(void)ForPrepaidPhoneOrderNumberPrice:(NSString *)price Give_money:(NSString *)give_money Pay_method:(NSString *)pay_method item_id:(NSString *)item_id andCallBack:(CallBack)callback;



@end
