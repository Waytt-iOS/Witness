//
//  SpinerLayer.h
//  登录按钮
//
//  Created by WangChaoLong on 16/6/3.
//  Copyright © 2016年 WCL-Mac. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface SpinerLayer : CAShapeLayer
-(instancetype) initWithFrame:(CGRect)frame;

-(void)animation;

-(void)stopAnimation;
@end
