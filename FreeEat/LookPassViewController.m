//
//  LookPassViewController.m
//  FreeEat
//
//  Created by mac- t4 on 15/11/28.
//  Copyright (c) 2015年 上海科文麦格里实业有限公司. All rights reserved.
//

#import "LookPassViewController.h"

@interface LookPassViewController ()

@end

@implementation LookPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBA(245, 241, 239, 1);
    
    self.title = @"找回密码";
    
    DJRegisterView *djzcView = [[DJRegisterView alloc]
                                initwithFrame:self.view.bounds djRegisterViewTypeSMS:DJRegisterViewTypeNoScanfSMS plTitle:@"请输入验证码"
                                title:@"提交"
                                
                                hq:^BOOL(NSString *phoneStr) {
                                    
                                    return YES;
                                }
                                
                                tjAction:^(NSString *yzmStr) {
                                    
                                }];
    [self.view addSubview:djzcView];
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
