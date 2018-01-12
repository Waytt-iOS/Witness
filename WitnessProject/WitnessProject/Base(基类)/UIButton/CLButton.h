//
//  CLButton.h
//  WitnessProject
//
//  Created by Wangchaolong on 2018/1/10.
//  Copyright © 2018年 Wyatt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLButton : UIButton
@property(assign , nonatomic) NSInteger section;
@property(assign , nonatomic) NSInteger row;
@property (nonatomic,assign) BOOL isState;

@end
