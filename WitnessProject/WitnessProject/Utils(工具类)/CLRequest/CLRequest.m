//
//  CLRequest.m
//  iMei-New
//
//  Created by 广州投一电子商务有限公司 on 16/7/14.
//  Copyright © 2016年 WCL-Mac. All rights reserved.
//

#import "CLRequest.h"
#import "AFNetworkReachabilityManager.h"
@implementation CLRequest

//ios自带的get请求方式
+(void)getddByUrlPath:(NSString *)path andParams:(NSString *)params andCallBack:(CallBack)callback{
    if (params) {
        [path stringByAppendingString:[NSString stringWithFormat:@"?%@",params]];
    }
    NSString*  pathStr = [path  stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
   NSLog(@"url:%@",pathStr);
    NSURL *url = [NSURL URLWithString:pathStr];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            //NSLog(@"%@",data);
            if (!data) {
                [ProgressHUD showWarning:@"请检查网络连接..."];
                return ;
            }
            id jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:Nil];
            //NSLog(@"%@",jsonData);
            if ([jsonData  isKindOfClass:[NSArray  class]]) {
                NSDictionary*  dic = jsonData[0];
                callback(dic);
            }else{
                callback(jsonData);
            }
        });
    }];
    //开始请求
    [task resume];
}
//ios自带的post请求方式
+(void)postddByByUrlPath:(NSString *)path andParams:(NSDictionary*)params andCallBack:(CallBack)callback{
    
    NSURL *url = [NSURL URLWithString:path];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSError*  error;
    
    if ([NSJSONSerialization isValidJSONObject:params]) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&error];
        [request  setHTTPBody:jsonData];
        
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSString*  str = [[NSString   alloc]initWithData:data encoding:NSUTF8StringEncoding];
               // NSLog(@"..........%@",str);
                id  jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:Nil];
                if ([jsonData  isKindOfClass:[NSArray  class]]) {
                    NSDictionary*  dic = jsonData[0];
                    
                    callback(dic);
                    
                    
                }else{
                    callback(jsonData);
                }
            });
            
        }];
        //开始请求
        [task resume];
        
    }
}
//拼接多个项目
//+(NSString *)generProject_ids:(NSArray *)array {
//    NSMutableString *appstr = [NSMutableString stringWithCapacity:0];
//    for ( CLSurroundingModel *model in array) {
//        //NSLog(@"%@",array);
//        NSString *ids = model.SurroundingID;
//        int num = [model.jianShu intValue];
//        [appstr appendString:[NSString stringWithFormat:@"&project_ids[%@]=%d",ids,num]];
//    }
//    //拼接别信息 也一样
//    return appstr;
//}
////获取项目订单号
//+(void)generateOrdersProject_ids:(NSString *)project_id Shop_id:(NSString *)shop_id Name:(NSString *)name Mobile:(NSString *)mobile Total_price:(NSString *)total_price Discount_price:(NSString *)discount_price Cash_coupon_id:(NSString *)cash_coupon_id
//                             Coupon_sn:(NSString *)coupon_sn Service_time:(NSString *)service_time Pay_method:(NSString *)pay_method Meal_id:(NSString *)meal_id Meal_name:(NSString *)meal_name Used_money:(NSString *)used_money Used_commission
//                                :(NSString *)used_commission andCallBack:(CallBack)callback{
//    //获取ToKen
//    NSString *strToKen = [CLKey authenticationToken];
//   // NSLog(@"strToKen===%@",strToKen);
//    NSString *strURL = [NSString stringWithFormat:
//                        @"%@app=cart&act=add_order&im_token=%@&%@&shop_id=%@&name=%@&mobile=%@&total_price=%@&discount_price=%@&cash_coupon_id=%@&coupon_sn=%@&service_time=%@&pay_method=%@&meal_id=%@&meal_name=%@&used_money=%@&used_commission=%@&source=AppStore",API,strToKen,project_id,shop_id,name,mobile,total_price,discount_price,cash_coupon_id,coupon_sn,service_time,pay_method,meal_id,meal_name,used_money,used_commission];
//   // NSLog(@"strURL == %@",strURL);
//   [self getddByUrlPath:strURL andParams:nil andCallBack:^(id json) {
//
//       callback(json);
//   }];
//}
////获取套餐订单号
//+(void)AccessToPackageTheOrderNumberMeal_id:(NSString *)meal_id Total_price:(NSString *)total_price Cash_coupon_id
//                                           :(NSString *)cash_coupon_id Coupon_sn
//                                           :(NSString *)coupon_sn
//                                 Pay_method:(NSString *)pay_method Used_money:(NSString *)used_money Used_commission
//                                           :(NSString *)used_commission Num:(NSString *)num andCallBack:(CallBack)callback{
//    //获取ToKen
//    NSString *strToKen = [CLKey authenticationToken];
//NSString *strURL = [NSString stringWithFormat:@"%@&app=cart&act=add_meal&im_token=%@&meal_id=%@&total_price=%@&cash_coupon_id=%@&coupon_sn=%@&pay_method=%@&used_money=%@&used_commission=%@&num=%@&source=AppStore",API,strToKen,meal_id,total_price,cash_coupon_id,coupon_sn,pay_method,used_money,used_commission,num];
//   // NSLog(@"拼接后的套餐URL:%@",strURL);
//
//    [self getddByUrlPath:strURL andParams:nil andCallBack:^(id json) {
//        callback(json);
//    }];
//}
////获取充值订单号
//+(void)ForPrepaidPhoneOrderNumberPrice:(NSString *)price Give_money:(NSString *)give_money Pay_method:(NSString *)pay_method item_id:(NSString *)item_id andCallBack:(CallBack)callback{
//    //获取ToKen
//    NSString *strToKen = [CLKey authenticationToken];
//    NSString *strURL = [NSString stringWithFormat:@"%@app=cart&act=add_recharge&im_token=%@&price=%@&give_money=%@&pay_method=%@&item_id=%@&source=AppStore",API,strToKen,price,give_money,pay_method,item_id
//];
//   // NSLog(@"拼接后的套餐URL:%@",strURL);
//    [self getddByUrlPath:strURL andParams:nil andCallBack:^(id json) {
//        callback(json);
//    }];
//}


@end
