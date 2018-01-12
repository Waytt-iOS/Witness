//
//  UIButton+CLButton.h
//  WitnessProject
//
//  Created by Wangchaolong on 2018/1/9.
//  Copyright © 2018年 Wyatt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CLButton)

@property(nonatomic , copy) void(^block)(UIButton*);
-(void)addTopBlock:(void(^)(UIButton *btn))block;


@end
