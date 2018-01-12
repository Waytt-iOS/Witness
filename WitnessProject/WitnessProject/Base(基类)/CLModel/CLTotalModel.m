//
//  CLTotalModel.m
//  WitnessProject
//
//  Created by Wangchaolong on 2018/1/11.
//  Copyright © 2018年 Wyatt. All rights reserved.
//

#import "CLTotalModel.h"

@implementation CLTotalModel
-(instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
//    if ([key isEqualToString:@"id"]) {
//        self.Project_id = value;
//        //  NSLog(@"id ====  %@",self.Project_id);
//    }
    
}
@end
@implementation setModel1


@end
