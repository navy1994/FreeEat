//
//  ForetasteDetailViewController.m
//  FreeEat
//
//  Created by mac- t4 on 15/11/30.
//  Copyright (c) 2015年 上海科文麦格里实业有限公司. All rights reserved.
//

#import "ForetasteDetailViewController.h"
#import "ApplyForetasteViewController.h"

#import "ForetasteDetailOneCell.h"
#import "ForetasteDetailTwoCell.h"
#import "ForetasteDetailThreeCell.h"

@interface ForetasteDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ForetasteDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(245, 241, 239, 1);
    self.title = @"试吃详情";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"shared-ico_selected"] style:UIBarButtonItemStyleDone target:self action:@selector(clickRightButton:)];
    
    self.tableView = [UITableView new];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIImageView *tableImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 250)];
    tableImageView.image = [UIImage imageNamed:@"advert2"];
    _tableView.tableHeaderView = tableImageView;
    [tableImageView sd_setImageWithURL:[NSURL URLWithString:[[_commidyDic objectForKey:@"default_image"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]
                       placeholderImage:[UIImage imageNamed:@"placeholder"]];
    [self.view addSubview:_tableView];
    
    UILabel *countdownLabel = [UILabel new];
    countdownLabel.text = @"倒计时：5天12时30分";
    countdownLabel.textColor = BackColor;
    countdownLabel.font = [UIFont boldSystemFontOfSize:14];
    countdownLabel.textAlignment = NSTextAlignmentCenter;
    countdownLabel.layer.cornerRadius = 5;
    countdownLabel.layer.masksToBounds = YES;
    countdownLabel.backgroundColor = OringeColor;
    [tableImageView addSubview:countdownLabel];
    
    UIView *viewBtn = [UIView new];
    viewBtn.backgroundColor = [UIColor blackColor];
    viewBtn.alpha = 0.5;
    [self.view addSubview:viewBtn];
    
    
    UIButton *applyBtn = [UIButton new];
    [applyBtn setTitle:@"申请试吃" forState:UIControlStateNormal];
    [applyBtn setBackgroundColor:RGB(253, 134, 111)];
    applyBtn.layer.cornerRadius = 8;
    applyBtn.layer.masksToBounds = YES;
    [applyBtn addTarget:self action:@selector(clickApplyBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:applyBtn];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [countdownLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(tableImageView.mas_right).with.offset(-10);
        make.bottom.equalTo(tableImageView.mas_bottom).with.offset(-10);
        make.width.mas_equalTo(@150);
        make.height.mas_equalTo(@20);
    }];
    
    [viewBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.and.right.and.bottom.equalTo(self.view).with.offset(0);
        make.height.mas_equalTo(@50);
    }];
    
    [applyBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(viewBtn.mas_centerY);
        make.height.mas_equalTo(@40);
        make.width.mas_equalTo(@200);
    }];
}

- (void)clickApplyBtn:(id)sender{
    ApplyForetasteViewController *applyForetasteController = [[ApplyForetasteViewController alloc]init];
    [self.navigationController pushViewController:applyForetasteController animated:YES];
}

#pragma mark ----- UITableViewDatabase
#pragma mark ----- UITableViewDatabase
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 70;
    }else if(indexPath.section == 1){
        return 80;
    }else{
        return 200;
    }
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        static NSString *cellIndentifier = @"CategoryCell";
        ForetasteDetailOneCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (cell == nil) {
            cell = [[ForetasteDetailOneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        }
        cell.numForetaste.text = @"免费试吃：5份";
        cell.numApply.text = @"已申请40份";
        cell.adressLabel.text = [NSString stringWithFormat:@"地址：%@",[_commidyDic objectForKey:@"region_name"]];
        return cell;
        
    }
    
    else if(indexPath.section == 1){
        
        static NSString *cellIndentifier = @"endcell";
        ForetasteDetailTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (cell == nil) {
            cell = [[ForetasteDetailTwoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        }
        cell.nameLabel.text = [NSString stringWithFormat:@"%@|%@",[_commidyDic objectForKey:@"store_name"],[_commidyDic objectForKey:@"goods_name"]];
        cell.classifyLabel.text = @"药源同食";
        cell.scoreLabel.text = @"9.8分";
        cell.commentLabel.text = @"12篇";
        return cell;
    }else{//推荐
        static NSString *cellIndentifier = @"endcell";
        ForetasteDetailThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (cell == nil) {
            cell = [[ForetasteDetailThreeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        }
        return cell;
    }
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
