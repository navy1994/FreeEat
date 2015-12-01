//
//  ForetasteDetailViewController.m
//  FreeEat
//
//  Created by mac- t4 on 15/11/30.
//  Copyright (c) 2015年 上海科文麦格里实业有限公司. All rights reserved.
//

#import "ForetasteDetailViewController.h"

@interface ForetasteDetailViewController ()

@end

@implementation ForetasteDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(245, 241, 239, 1);
    self.title = @"试吃详情";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"shared-ico_selected"] style:UIBarButtonItemStyleDone target:self action:@selector(clickRightButton:)];

}

- (void)clickRightButton:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"暂未实现" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
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
