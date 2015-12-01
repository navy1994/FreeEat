//
//  LoginViewController.m
//  FreeEat
//
//  Created by mac- t4 on 15/11/28.
//  Copyright (c) 2015年 上海科文麦格里实业有限公司. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "LookPassViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(245, 241, 239, 1);
    
    self.title = @"欢迎登录";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu-ico"] style:UIBarButtonItemStyleDone target:self action:@selector(selectLeftAction:)];
    
    
    DJRegisterView *registerView = [[DJRegisterView alloc]
                                    initwithFrame:
                                    self.view.bounds
                                    djRegisterViewType:DJRegisterViewTypeNav action:^(NSString *acc, NSString *key) {
                                        NSLog(@"点击了登录");
                                        NSLog(@"\n输入的账户%@\n密码%@",acc,key);
                                    } zcAction:^{
                                        NSLog(@"点击了 注册");
                                        RegisterViewController *registerController = [[RegisterViewController alloc]init];
                                        [self.navigationController pushViewController:registerController animated:YES];
                                    } wjAction:^{
                                        LookPassViewController *lookPassController = [[LookPassViewController alloc]init];
                                        [self.navigationController pushViewController:lookPassController animated:YES];
                                        NSLog(@"点击了   忘记密码");
                                    }];
    [self.view addSubview:registerView];

}

-(void)selectLeftAction:(id)sender
{
    [[AppDelegate mainDelegate].slideMenuVC toggleMenu];
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
