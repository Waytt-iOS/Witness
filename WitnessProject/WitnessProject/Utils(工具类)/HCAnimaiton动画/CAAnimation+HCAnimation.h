//
//  CAAnimation+HCAnimation.h
//  HCKit
//
//  Created by Caoyq on 16/5/31.
//  Copyright © 2016年 honeycao. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, Axis) {
    AxisX = 0,  ///< x轴
    AxisY,      ///< y轴
    AxisZ       ///< z轴
};

typedef NS_ENUM(NSInteger, ShakeDerection) {
    ShakeDerectionAxisX = 0,    ///< 左右
    ShakeDerectionAxisY,        ///< 上下
};

@interface CAAnimation (HCAnimation)
+ (void)showAnimationType:(NSString *)type
              withSubType:(NSString *)subType
                 duration:(CFTimeInterval)duration
           timingFunction:(NSString *)timingFunction
                     view:(UIView *)theView;
/**
 * 在具体的UIView上实现一个缩放的动画
 *@param   view         动画的载体
 *@param   scaleValue   最终缩放值
 *@param   repeat       动画循环次数，0表示无限循环
 *@param   duration     动画运行一次的时间
 *@return  void
 */
+ (void)showScaleAnimationInView:(UIView *)view ScaleValue:(CGFloat)scaleValue Repeat:(CGFloat)repeat Duration:(CGFloat)duration;

/**
 * 在具体的UIView上实现一个移动的动画
 *@param   view         动画的载体
 *@param   Position     最终停留的位置(中心点坐标)
 *@param   repeat       动画循环次数，0表示无限循环
 *@param   duration     动画运行一次的时间
 *@return  void
 */
+ (void)showMoveAnimationInView:(UIView *)view Position:(CGPoint)position Repeat:(CGFloat)repeat Duration:(CGFloat)duration;

/**
 * 在具体的UIView上实现一个旋转的动画
 *@param   view         动画的载体
 *@param   degree       旋转的弧度
 *@param   direction    旋转的方向
 *@param   repeat       动画循环次数，0表示无限循环
 *@param   duration     动画运行一次的时间
 *@return  void
 */
+ (void)showRotateAnimationInView:(UIView *)view Degree:(CGFloat)degree Direction:(Axis)direction Repeat:(CGFloat)repeat Duration:(CGFloat)duration;

/**
 * 在具体的UIView上实现一个透明度渐变的动画
 *@param   view         动画的载体
 *@param   alpha        最终显示的透明度
 *@param   repeat       动画循环次数，0表示无限循环
 *@param   duration     动画运行一次的时间
 *@return  void
 */
+ (void)showOpacityAnimationInView:(UIView *)view Alpha:(CGFloat)alpha Repeat:(CGFloat)repeat Duration:(CGFloat)duration;

/**
 * 在具体的UIView上实现一个震动的动画
 *@param   view         动画的载体
 *@param   offset       震动的偏移量
 *@param   derection    震动方向
 *@param   repeat       动画循环次数，0表示无限循环
 *@param   duration     动画运行一次的时间
 *@return  void
 */
+ (void)showShakeAnimationInView:(UIView *)view Offset:(CGFloat)offset Direction:(ShakeDerection)derection Repeat:(CGFloat)repeat Duration:(CGFloat)duration;

/**
 *清除具体UIView上的所有动画
 *@param   view   实施清除的对象
 *@return  void
 */
+ (void)clearAnimationInView:(UIView *)view;



/**
 *  下面是一些常用的动画效果
 */

// 揭露
+ (void)animationRevealFromBottom:(UIView *)view;
+ (void)animationRevealFromTop:(UIView *)view;
+ (void)animationRevealFromLeft:(UIView *)view;
+ (void)animationRevealFromRight:(UIView *)view;

// 渐隐渐消
+ (void)animationEaseIn:(UIView *)view;
+ (void)animationEaseOut:(UIView *)view;

// 翻转
+ (void)animationFlipFromLeft:(UIView *)view;
+ (void)animationFlipFromRigh:(UIView *)view;

// 翻页
+ (void)animationCurlUp:(UIView *)view;
+ (void)animationCurlDown:(UIView *)view;

// push
+ (void)animationPushUp:(UIView *)view;
+ (void)animationPushDown:(UIView *)view;
+ (void)animationPushLeft:(UIView *)view;
+ (void)animationPushRight:(UIView *)view;

// 移动
+ (void)animationMoveUp:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationMoveDown:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationMoveLeft:(UIView *)view;
+ (void)animationMoveRight:(UIView *)view;

// 旋转缩放

// 各种旋转缩放效果
+ (void)animationRotateAndScaleEffects:(UIView *)view;

// 旋转同时缩小放大效果
+ (void)animationRotateAndScaleDownUp:(UIView *)view;



#pragma mark - Private API

/**
 *  下面动画里用到的某些属性在当前API里是不合法的,但是也可以用.
 */
//上下翻转
+ (void)animationFlipFromTop:(UIView *)view;
+ (void)animationFlipFromBottom:(UIView *)view;

//从各个方向翻转
+ (void)animationCubeFromLeft:(UIView *)view;
+ (void)animationCubeFromRight:(UIView *)view;
+ (void)animationCubeFromTop:(UIView *)view;
+ (void)animationCubeFromBottom:(UIView *)view;
//吸附效果
+ (void)animationSuckEffect:(UIView *)view;
//波动效果
+ (void)animationRippleEffect:(UIView *)view;
//照相机
+ (void)animationCameraOpen:(UIView *)view;
+ (void)animationCameraClose:(UIView *)view;




@end
