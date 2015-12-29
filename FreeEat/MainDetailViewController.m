//
//  MainDetailViewController.m
//  FreeEat
//
//  Created by mac- t4 on 15/11/30.
//  Copyright (c) 2015年 上海科文麦格里实业有限公司. All rights reserved.
//

#import "MainDetailViewController.h"
//#import "ForetasteDetailViewController.h"
#import "MainDtailOneCell.h"
#import "MainDetailTwoCell.h"
#import "MainDetailThreeCell.h"

@interface MainDetailViewController ()<UITableViewDataSource, UITableViewDelegate>{
    float ret;
}

@property (nonatomic, strong) UIImageView *commodityView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MainDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(245, 241, 239, 1);
    self.title = @"商品详情";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"shared-ico_selected"] style:UIBarButtonItemStyleDone target:self action:@selector(clickRightButton:)];
    
    
    [self initUI];
    //注册
    [SDWebImageManager sharedManager].imageDownloader.username = @"httpwatch";
    [SDWebImageManager sharedManager].imageDownloader.password = @"httpwatch01";
    //设定图片存储顺序
    [SDWebImageManager.sharedManager.imageDownloader setValue:@"SDWebImage Demo" forHTTPHeaderField:@"AppName"];
    SDWebImageManager.sharedManager.imageDownloader.executionOrder = SDWebImageDownloaderLIFOExecutionOrder;
    
    
}

- (void)initUI{
    self.tableView = [UITableView new];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    
    self.commodityView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 200)];
    _commodityView.backgroundColor = [UIColor whiteColor];
    if (_isAdvert) {
        [ _commodityView sd_setImageWithURL:[NSURL URLWithString:[[NSString stringWithFormat:@"%@%@",ENAPP_URL,[_commidyDic objectForKey:@"default_image"]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]
                           placeholderImage:[UIImage imageNamed:@"placeholder"]];
    }else{
        [ _commodityView sd_setImageWithURL:[NSURL URLWithString:[[_commidyDic objectForKey:@"default_image"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]
                           placeholderImage:[UIImage imageNamed:@"placeholder"]];
    }
   
    ret = self.commodityView.image.size.height / self.commodityView.image.size.width;
    _commodityView.frame = CGRectMake(0, 0, screen_width, /*screen_width*ret*/250);
    _tableView.tableHeaderView = _commodityView;
    
    UIView *viewBtn = [UIView new];
    viewBtn.backgroundColor = [UIColor blackColor];
    viewBtn.alpha = 0.5;
    [self.view addSubview:viewBtn];
    
    
    UIButton *applyBtn = [UIButton new];
    [applyBtn setTitle:@"去免费吃" forState:UIControlStateNormal];
    [applyBtn setBackgroundColor:RGB(253, 134, 111)];
    applyBtn.layer.cornerRadius = 8;
    applyBtn.layer.masksToBounds = YES;
    [applyBtn addTarget:self action:@selector(clickApplyBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:applyBtn];


    [_tableView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
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
    NSLog(@"%@",_commidyDic);
}

- (void)clickApplyBtn:(id)sender{
//    ForetasteDetailViewController *foretasteController = [[ForetasteDetailViewController alloc]init];
//    foretasteController.commidyDic = _commidyDic;
//    [self.navigationController pushViewController:foretasteController animated:YES];
}


- (void)clickRightButton:(id)sender{
    
}

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
        return 110;
    }else{
        return 200;
    }
}


//- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 0) {
//        static NSString *cellIndentifier = @"CategoryCell";
//        MainDtailOneCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
//        if (cell == nil) {
//            cell = [[MainDtailOneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
//        }
//         cell.priceLabel.text = [_commidyDic objectForKey:@"price"];
//        return cell;
//        
//    }
//    
//    else if(indexPath.section == 1){
//        
//        static NSString *cellIndentifier = @"endcell";
//        MainDetailTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
//        if (cell == nil) {
//            cell = [[MainDetailTwoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
//        }
//        cell.nameLabel.text = [NSString stringWithFormat:@"%@|%@",[_commidyDic objectForKey:@"store_name"],[_commidyDic objectForKey:@"goods_name"]];
//        cell.adressLabel.text = [NSString stringWithFormat:@"地址：%@",[_commidyDic objectForKey:@"region_name"]];
//        return cell;
//    }else{//推荐
//        static NSString *cellIndentifier = @"endcell";
//        MainDetailThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
//        if (cell == nil) {
//            cell = [[MainDetailThreeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
//        }
//        return cell;
//    }
//}


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
