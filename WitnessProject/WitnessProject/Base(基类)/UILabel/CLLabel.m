//
//  CLLabel.m
//  WitnessProject
//
//  Created by Wangchaolong on 2018/1/9.
//  Copyright © 2018年 Wyatt. All rights reserved.
//

#import "CLLabel.h"

@implementation CLLabel
@synthesize verticalAlignment;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        verticalAlignment = VerticalAlignmentTop;
    }
    return self;
}

- (VerticalAlignment)verticalAlignment
{
    return verticalAlignment;
}

- (void)setVerticalAlignment:(VerticalAlignment)align
{
    verticalAlignment = align;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect rc = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (verticalAlignment) {
        case VerticalAlignmentTop:
            rc.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentBottom:
            rc.origin.y = bounds.origin.y + bounds.size.height - rc.size.height;
            break;
        default:
            rc.origin.y = bounds.origin.y + (bounds.size.height - rc.size.height)/2;
            break;
    }
    
    return rc;
}

- (void)drawTextInRect:(CGRect)rect
{
    CGRect rc = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:rc];
}

//调整文本中的行距的方法

/*使用方法
 *
 *text参数 ：文本内容
 *
 *height参数：行距
 *
 *name 参数：你使用的 UIlable 对象
 */
- (void) getlable_height :(NSString *) text uiheight:(NSInteger) height uilable:(UILabel*) name
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:height];//调整行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    name.attributedText = attributedString;
    
} 
+ (UILabel *)commonLabelWithFrame:(CGRect)frame
                             text:(NSString*)text
                            color:(UIColor*)color
                             font:(UIFont*)font
                    textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.textColor = color;
    label.font = font;
    label.textAlignment = textAlignment;
    
    label.backgroundColor = [UIColor clearColor];
    
    return label;
}
//动态设置Label的高度
+ (UILabel *)dynamicHeightLabelWithPointX:(CGFloat)pointX
                                   pointY:(CGFloat)pointY
                                    width:(CGFloat)width
                               strContent:(NSString *)strContent
                                    color:(UIColor *)color
                                     font:(UIFont *)font
                            textAlignmeng:(NSTextAlignment)textAlignmeng
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{NSFontAttributeName:font,
                                 NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize labelSize = [strContent boundingRectWithSize:CGSizeMake(width,MAXFLOAT)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:attributes
                                                context:nil].size;
    
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(pointX, pointY, width, labelSize.height)];
    [myLabel setNumberOfLines:0];
    myLabel.text = strContent;
    myLabel.font = font;
    myLabel.textColor = color;
    return myLabel;
    
}  

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
