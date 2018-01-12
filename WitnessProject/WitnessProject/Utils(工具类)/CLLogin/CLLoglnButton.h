//
//  CLLoglnButton.h
//  登录按钮
//
//  Created by WangChaoLong on 16/6/3.
//  Copyright © 2016年 WCL-Mac. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "SpinerLayer.h"
typedef void(^Completion)();

@interface CLLoglnButton : UIButton
@property (nonatomic,retain) SpinerLayer *spiner;

-(void)setCompletion:(Completion)completion;

-(void)StartAnimation;

-(void)ErrorRevertAnimationCompletion:(Completion)completion;

-(void)ExitAnimationCompletion:(Completion)completion;


@end
