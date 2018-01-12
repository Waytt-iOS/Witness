//
//  CLLabel.h
//  WitnessProject
//
//  Created by Wangchaolong on 2018/1/9.
//  Copyright © 2018年 Wyatt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLLabel : UILabel

@property(assign , nonatomic) NSInteger section;
@property(assign , nonatomic) NSInteger row;
@property (nonatomic,assign) BOOL isState;

typedef enum{
    VerticalAlignmentTop = 0, //default 垂直顶端对齐
    VerticalAlignmentMidele,  //顶端居中对齐
    VerticalAlignmentBottom,  //顶端靠右对齐
}VerticalAlignment;

@property (nonatomic, assign) VerticalAlignment verticalAlignment;  

+ (UILabel *)commonLabelWithFrame:(CGRect)frame
                             text:(NSString*)text
                            color:(UIColor*)color
                             font:(UIFont*)font
                    textAlignment:(NSTextAlignment)textAlignment;
/**
 *  创建一个动态高度的UILabel
 *
 *  @param pointX        Label的横坐标
 *  @param pointY        Label的纵坐标
 *  @param width         Label的宽度
 *  @param strContent    内容
 *  @param color         字体颜色
 *  @param font          字体大小
 *  @param textAlignmeng 对齐方式
 *
 *  @return 返回一个UILabel
 */
+ (UILabel *)dynamicHeightLabelWithPointX:(CGFloat)pointX
                                   pointY:(CGFloat)pointY
                                    width:(CGFloat)width
                               strContent:(NSString *)strContent
                                    color:(UIColor *)color
                                     font:(UIFont *)font
                            textAlignmeng:(NSTextAlignment)textAlignmeng; 
@end
