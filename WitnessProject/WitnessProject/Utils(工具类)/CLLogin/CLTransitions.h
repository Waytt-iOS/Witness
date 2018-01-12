//
//  CLTransitions.h
//  登录按钮
//
//  Created by WangChaoLong on 16/6/3.
//  Copyright © 2016年 WCL-Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CLTransitions : NSObject <UIViewControllerAnimatedTransitioning>

-(instancetype) initWithTransitionDuration:(NSTimeInterval)transitionDuration StartingAlpha:(CGFloat)startingAlpha isBOOL:(BOOL)is;


@end
