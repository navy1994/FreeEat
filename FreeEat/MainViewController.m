//
//  MainViewController.m
//  FreeEat
//
//  Created by mac- t4 on 15/11/25.
//  Copyright (c) 2015年 上海科文麦格里实业有限公司. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import <DYMRollingBanner/DYMRollingBannerVC.h>
#import "MainTableViewCell.h"
#import "MainDetailViewController.h"

const CGFloat LSWHeaderViewHeight = 200;

@interface MainViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>{
    DYMRollingBannerVC      *_rollingBannerVC;
    MASConstraint *_headerViewLeftConstraint;//左边约束
    MASConstraint *_headerViewWidthConstraint;//宽的约束
    MASConstraint *_headerViewTopConstraint;//上边的约束
    MASConstraint *_headerViewHeightConstraint;//高的约束
}
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSDictionary *listDictionary;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:241.0/255.0 blue:239.0/255.0 alpha:1.0];
    self.title = @"推荐";

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu-ico"] style:UIBarButtonItemStyleDone target:self action:@selector(selectLeftAction:)];
    
    [self setupUI];
    
    self.listDictionary = @{@"imgName":@"advert2",@"name":@"循疾问食｜商品名",@"tags":@"商品*************"};
}

- (void)setupUI{
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[[UIColor clearColor] colorWithAlphaComponent:0]] forBarMetrics:UIBarMetricsDefault];
//    self.automaticallyAdjustsScrollViewInsets=NO;
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height-30) style:UITableViewStyleGrouped];
    _tableView.showsVerticalScrollIndicator =
    NO;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _tableView.sectionHeaderHeight = 0;
    _tableView.separatorStyle = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.contentInset= UIEdgeInsetsMake(LSWHeaderViewHeight, 0, 0, 0);
    [self.view addSubview:_tableView];
    
    _rollingBannerVC = [DYMRollingBannerVC new];
    [self addChildViewController:_rollingBannerVC];
    [_tableView addSubview:_rollingBannerVC.view];
    
    [_rollingBannerVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        _headerViewLeftConstraint = make.left.equalTo(@0);
        _headerViewWidthConstraint = make.width.equalTo(@(_tableView.frame.size.width));
        _headerViewTopConstraint = make.top.equalTo(@(-LSWHeaderViewHeight));
        _headerViewHeightConstraint = make.height.equalTo(@(LSWHeaderViewHeight+20));
    }];
    
    [_rollingBannerVC didMoveToParentViewController:self];
    
    _rollingBannerVC.rollingInterval = 5;
    _rollingBannerVC.rollingImages = @[[UIImage imageNamed:@"advert1"]
                                     , [UIImage imageNamed:@"advert2"]
                                     , [UIImage imageNamed:@"advert3"]
                                     , [UIImage imageNamed:@"advert2"]    // Local Image
                                     , [UIImage imageNamed:@"advert3"]    // Locak Image
                                      ];
    
    [_rollingBannerVC addBannerTapHandler:^(NSInteger whichIndex) {
        MainDetailViewController *tapViewController = [[MainDetailViewController alloc]init];
        tapViewController.dic = self.listDictionary;
        [self.navigationController pushViewController:tapViewController animated:YES];
        
    }];
    [_rollingBannerVC startRolling];
    
}

#pragma mark ----- UITableViewDatabase
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 310;
}

- (MainTableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifier = @"mainTableCell";
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.commodityImageView.image = [UIImage imageNamed:[_listDictionary objectForKey:@"imgName"]];
    cell.commodityName.text = [_listDictionary objectForKey:@"name"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MainDetailViewController *detailController = [[MainDetailViewController alloc]init];
    detailController.dic = self.listDictionary;
    [self.navigationController pushViewController:detailController animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOffset  = scrollView.contentOffset.y;
    CGFloat xOffset = (yOffset + LSWHeaderViewHeight)/2;
    if (yOffset < -LSWHeaderViewHeight) {
        _headerViewTopConstraint.offset = yOffset;
        _headerViewLeftConstraint.offset = xOffset;
        _headerViewWidthConstraint.offset = _tableView.frame.size.width + fabs(xOffset) * 2;
        _headerViewHeightConstraint.offset = -yOffset+20;
    }
 //   CGFloat alpha = (yOffset + LSWHeaderViewHeight)/LSWHeaderViewHeight;
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[RGB(260.0, 260.0, 248.0) colorWithAlphaComponent:alpha]] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.alpha = alpha;
    //        alpha = fabs(alpha);
    //        alpha = fabs(1 - alpha);
    //        alpha = alpha < 0.5 ? 0.5 : alpha;
    //        _rollingBannerVC.view.alpha = alpha;
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
