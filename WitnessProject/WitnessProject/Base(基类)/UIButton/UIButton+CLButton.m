//
//  UIButton+CLButton.m
//  WitnessProject
//
//  Created by Wangchaolong on 2018/1/9.
//  Copyright © 2018年 Wyatt. All rights reserved.
//

#import "UIButton+CLButton.h"
@implementation UIButton (CLButton)


-(void)setBlock:(void(^)(UIButton*))block
{
    objc_setAssociatedObject(self,@selector(block), block,OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self addTarget:self action:@selector(click:)forControlEvents:UIControlEventTouchUpInside];
    
}
-(void(^)(UIButton*))block

{
    
    return objc_getAssociatedObject(self,@selector(block));
    
}

-(void)addTopBlock:(void(^)(UIButton*))block

{
    
    self.block= block;
    
    [self addTarget:self action:@selector(click:)forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)click:(UIButton*)btn

{
    
    if(self.block) {
        
        self.block(btn);
        
    }
    
}



@end
