//
//  FENavigationController.m
//  FreeEat
//
//  Created by mac- t4 on 15/11/28.
//  Copyright (c) 2015年 上海科文麦格里实业有限公司. All rights reserved.
//

#import "FENavigationController.h"

@interface FENavigationController ()

@end

@implementation FENavigationController

- (id)initWithRootViewController:(UIViewController *)rootViewController{
    if ([super initWithRootViewController:rootViewController]) {
        self.navigationBar.translucent = NO;
        self.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,[UIFont fontWithName:@"Marion-Italic" size:20.0],UITextAttributeFont,nil];
        self.navigationBar.tintColor = [UIColor whiteColor];
        self.navigationBar.barTintColor = RGBA(253, 134, 111, 1);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
