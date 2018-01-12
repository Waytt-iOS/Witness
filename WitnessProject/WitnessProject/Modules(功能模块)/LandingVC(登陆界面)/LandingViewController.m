//
//  LandingViewController.m
//  WitnessProject
//
//  Created by Wangchaolong on 2018/1/11.
//  Copyright © 2018年 Wyatt. All rights reserved.
//

#import "LandingViewController.h"

@interface LandingViewController ()
@property (strong , nonatomic)CLLoglnButton *log;//登陆按钮
@property (assign , nonatomic) BOOL isSwitch;//判断是否可以登陆

@end

@implementation LandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //布局登陆按钮
    [self setupLandingButton];
    
}
-(void)setupLandingButton{
    
    
    
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
