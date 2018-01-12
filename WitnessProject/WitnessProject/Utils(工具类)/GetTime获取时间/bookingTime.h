//
//  bookingTime.h
//  日历
//
//  Created by WangChaoLong on 16/6/14.
//  Copyright © 2016年 WCL-Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface bookingTime : NSObject
//获取本地 当前年月日时分秒
+(NSString *)getCurrentTime;
//获取本地 当前年
+(NSString *)getCurrentYears;
//获取本地 当前月
+(NSString *)getCurrentMonth;
//获取本地 当前日
+(NSString *)getCurrentDay;
//获取本地 当前时
+(NSString *)getCurrentwhen;
//获取本地 当前分
+(NSString *)getCurrentPoints;
//获取本地 当前秒
+(NSString *)getCurrentSeconds;
//获取当前周几
+(NSString *)getCurrentWeek;
// 获取某年某月总共多少天
+ (int)getDaysInMonth:(int)year month:(int)imonth ;
//获取到未来那天   或者   以前那天(- **)
+(NSString *)GetTomorrowFutureDay:(NSDate *)aDate FutureMonth:(int)month
;
+(NSString *)GetTomorrowFutureDay22:(NSDate *)aDate FutureMonth:(int)month;
//获得月/号
+(NSString *)GetTomorrowDay:(NSDate *)aDate Month:(int)month;
//获取当前周几
+(NSString *)getCurrentWeekADate:(NSDate *)aDate Month:(int)month;
@end
