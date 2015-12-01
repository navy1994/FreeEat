//
//  MainDetailViewController.m
//  FreeEat
//
//  Created by mac- t4 on 15/11/30.
//  Copyright (c) 2015年 上海科文麦格里实业有限公司. All rights reserved.
//

#import "MainDetailViewController.h"

@interface MainDetailViewController ()

@property (nonatomic, strong) UIImageView *commodityView;
@property (nonatomic, strong) UILabel *commodityName;
@property (nonatomic, strong) UILabel *tagsLabel;

@end

@implementation MainDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(245, 241, 239, 1);
    self.title = @"商品详情";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"shared-ico_selected"] style:UIBarButtonItemStyleDone target:self action:@selector(clickRightButton:)];
    
    
    self.commodityView = [UIImageView new];
    _commodityView.image = [UIImage imageNamed:[self.dic objectForKey:@"imgName"]];
    [self.view addSubview:_commodityView];
    [_commodityView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.and.left.and.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(@200);
    }];
    
    self.commodityName = [UILabel new];
    _commodityName.text = [self.dic objectForKey:@"name"];
    _commodityName.font = [UIFont boldSystemFontOfSize:20];
    _commodityName.textColor = [UIColor grayColor];
    [self.view addSubview:_commodityName];
    [_commodityName mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_commodityView.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(@50);
    }];
    
    
    self.tagsLabel = [UILabel new];
    self.tagsLabel.text = [self.dic objectForKey:@"tags"];
    [self.view addSubview:_tagsLabel];
    [_tagsLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.commodityName.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(@(screen_height-270));
    }];
}

- (void)clickRightButton:(id)sender{
    
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
