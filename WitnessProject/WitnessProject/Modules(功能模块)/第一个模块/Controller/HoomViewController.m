//
//  HoomViewController.m
//  WitnessProject
//
//  Created by Wangchaolong on 2018/1/11.
//  Copyright © 2018年 Wyatt. All rights reserved.
//
#import "HoomViewController.h"
#import "ThirdViewController.h"
@interface HoomViewController ()<XYTransitionProtocol>

@end

@implementation HoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    UIView *view = [[UIView alloc]init];
    //这是在Mac book pro 上的操作


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
