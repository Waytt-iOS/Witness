//
//  bookingTime.m
//  日历
//
//  Created by WangChaoLong on 16/6/14.
//  Copyright © 2016年 WCL-Mac. All rights reserved.
//

#import "bookingTime.h"

@implementation bookingTime

//获取到未来那天   或者   以前那天(- **)
+(NSString *)GetTomorrowFutureDay:(NSDate *)aDate FutureMonth:(int)month
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:aDate];
    [components setDay:([components day]+month)];
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init] ;
    [dateday setDateFormat:@"yyyy-MM-dd"];
   
    return [dateday stringFromDate:beginningOfWeek];
}
+(NSString *)GetTomorrowFutureDay22:(NSDate *)aDate FutureMonth:(int)month
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:aDate];
    [components setDay:([components day]+month)];
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init] ;
    [dateday setDateFormat:@"yyyyMMdd"];
    
    return [dateday stringFromDate:beginningOfWeek];
}

//获得月/号
+(NSString *)GetTomorrowDay:(NSDate *)aDate Month:(int)month
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:aDate];
    [components setDay:([components day]+month)];
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init] ;
    [dateday setDateFormat:@"M.d"];
    
    return [dateday stringFromDate:beginningOfWeek];
}
//获取当前周几
+(NSString *)getCurrentWeekADate:(NSDate *)aDate Month:(int)month{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:aDate];
    [components setDay:([components day]+month)];
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyy"];
    [dateformatter setDateFormat:@"EEE"];
    NSString *  weekString = [dateformatter stringFromDate:beginningOfWeek];
   // NSLog(@"-%@",weekString);
    return weekString;
    
}


// 获取某年某月总共多少天
+ (int)getDaysInMonth:(int)year month:(int)imonth {
    // imonth == 0的情况是应对在CourseViewController里month-1的情况
    if((imonth == 0)||(imonth == 1)||(imonth == 3)||(imonth == 5)||(imonth == 7)||(imonth == 8)||(imonth == 10)||(imonth == 12))
        return 31;
    if((imonth == 4)||(imonth == 6)||(imonth == 9)||(imonth == 11))
        return 30;
    if((year%4 == 1)||(year%4 == 2)||(year%4 == 3))
    {
        return 28;
    }
    if(year%400 == 0)
        return 29;
    if(year%100 == 0)
        return 28;
    return 29;
}

//获取本地 当前年月日时分秒
+(NSString *)getCurrentTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    NSString *string = dateTime;
   // NSLog(@"%@",string);
    return string;
    
}
//获取本地 当前年
+(NSString *)getCurrentYears{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    NSString *string = dateTime;
   // NSLog(@"%@",string);
    return string;
    
}
//获取本地 当前月
+(NSString *)getCurrentMonth{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    NSString *string = dateTime;
   // NSLog(@"%@",string);
    return string;
    
}
//获取本地 当前日
+(NSString *)getCurrentDay{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    NSString *string = dateTime;
   // NSLog(@"%@",string);
    return string;
    
}
//获取本地 当前时
+(NSString *)getCurrentwhen{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    NSString *string = dateTime;
   // NSLog(@"%@",string);
    return string;
    
}
//获取本地 当前分
+(NSString *)getCurrentPoints{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"mm"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    NSString *string = dateTime;
   // NSLog(@"%@",string);
    return string;
    
}
//获取本地 当前秒
+(NSString *)getCurrentSeconds{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"ss"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    NSString *string = dateTime;
    //NSLog(@"%@",string);
    return string;
    
}
//获取当前周几
+(NSString *)getCurrentWeek{
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyy"];
    [dateformatter setDateFormat:@"EEE"];
    NSString *  weekString = [dateformatter stringFromDate:senddate];
    //NSLog(@"-%@",weekString);
    return weekString;
    
}



@end
