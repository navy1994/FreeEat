//
//  PersonageViewController.m
//  FreeEat
//
//  Created by mac- t4 on 15/11/26.
//  Copyright (c) 2015年 上海科文麦格里实业有限公司. All rights reserved.
//

#import "PersonageViewController.h"
#import "PersonageBgView.h"
#import "AppDelegate.h"
#import "SettingViewController.h"
#import "AKSegmentedControl.h"

const CGFloat BackGroupHeight = 150;

@interface PersonageViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>{
    UITableView *_tableView;
    
    UIImageView *imageBG;
    PersonageBgView *BGView;
    
    UIButton *leftBtn;
    UIButton *rightBtn;
    
    AKSegmentedControl *_segmentedControl;
}

@end

@implementation PersonageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(245, 241, 239, 1);
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];

    self.title = @"个人中心";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu-ico"] style:UIBarButtonItemStyleDone target:self action:@selector(selectLeftAction:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"setting-ico"] style:UIBarButtonItemStyleDone target:self action:@selector(selectRightAction:)];
    
    [self setupUI];
}

- (void)setupUI{
    _tableView=[[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.frame=[UIScreen mainScreen].bounds;
    _tableView.contentInset=UIEdgeInsetsMake(BackGroupHeight, 0, 0, 0);
    
    [self.view addSubview:_tableView];
    
    //
    imageBG=[[UIImageView alloc]init];
    imageBG.frame=CGRectMake(0, -BackGroupHeight, screen_width, BackGroupHeight);
    imageBG.image=[UIImage imageWithColor:RGB(253, 134, 111)];
    
    [_tableView addSubview:imageBG];
    //
    BGView=[[PersonageBgView alloc]initWithFrame:CGRectMake(0, -BackGroupHeight, screen_width, BackGroupHeight)];
    [_tableView addSubview:BGView];
    
    UIView *segmentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 45)];
    segmentView.backgroundColor = RGBA(245, 241, 239, 1);
    _tableView.tableHeaderView = segmentView;
    
    //初始化segment
    _segmentedControl = [[AKSegmentedControl alloc] initWithFrame:CGRectMake(20, 5, screen_width-40, 35)];
    [_segmentedControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    [_segmentedControl setSegmentedControlMode:AKSegmentedControlModeSticky];
    [_segmentedControl setSelectedIndex:0];
    _segmentedControl.layer.cornerRadius = 8;
    _segmentedControl.layer.masksToBounds = YES;
    
    [segmentView addSubview:_segmentedControl];
    
    [self setupSegmentedControl];
    
}

- (void)segmentedControlValueChanged:(id)sender
{
    AKSegmentedControl *segmentedControl = (AKSegmentedControl *)sender;
    
    
}

- (void)setupSegmentedControl{
    UIImage *backgroundImage = [[UIImage imageWithColor:RGBA(245, 241, 239, 1)] resizableImageWithCapInsets:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)];
    [_segmentedControl setBackgroundImage:backgroundImage];
    [_segmentedControl setContentEdgeInsets:UIEdgeInsetsMake(2.0, 2.0, 3.0, 2.0)];
    [_segmentedControl setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin];
    
    [_segmentedControl setSeparatorImage:[UIImage imageWithColor:RGBA(253, 134, 111, 1)]];
    
    UIImage *buttonBackgroundImagePressedLeft = [[UIImage imageWithColor:RGBA(253, 134, 111, 1)]
                                                 resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 4.0, 0.0, 1.0)];
    UIImage *buttonBackgroundImagePressedCenter = [[UIImage imageWithColor:RGBA(253, 134, 111, 1)]
                                                   resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 4.0, 0.0, 1.0)];
    
    // Button 1
    UIButton *buttonSocial = [[UIButton alloc] init];
    UIImage *buttonSocialImageNormal = [UIImage imageNamed:@"collect-ico"];
    UIImage *buttonSocialImageSelect = [UIImage imageNamed:@"collect-ico_selected"];
    buttonSocial.layer.borderColor = RGBA(253, 134, 111, 1).CGColor;
    buttonSocial.layer.borderWidth = 2;
    [buttonSocial setTitle:@"收藏历史" forState:UIControlStateNormal];
    [buttonSocial setTitleColor:RGBA(253, 134, 111, 1) forState:UIControlStateNormal];
    [buttonSocial setTitleColor:RGBA(245, 241, 239, 1) forState:UIControlStateSelected];
    //[buttonSocial setTitleColor:RGBA(253, 134, 111, 1) forState:UIControlStateDisabled];
    //[buttonSocial setTitleShadowColor:RGBA(245, 241, 239, 1) forState:UIControlStateNormal];
    //[buttonSocial.titleLabel setShadowOffset:CGSizeMake(0.0, 1.0)];
    [buttonSocial.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0]];
    [buttonSocial setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 5.0, 0.0, 0.0)];
    
    [buttonSocial setBackgroundImage:buttonBackgroundImagePressedLeft forState:UIControlStateHighlighted];
    [buttonSocial setBackgroundImage:buttonBackgroundImagePressedLeft forState:UIControlStateSelected];
    [buttonSocial setBackgroundImage:buttonBackgroundImagePressedLeft forState:(UIControlStateHighlighted|UIControlStateSelected)];
    [buttonSocial setImage:buttonSocialImageNormal forState:UIControlStateNormal];
    [buttonSocial setImage:buttonSocialImageSelect forState:UIControlStateSelected];
    [buttonSocial setImage:buttonSocialImageNormal forState:UIControlStateHighlighted];
    [buttonSocial setImage:buttonSocialImageNormal forState:(UIControlStateHighlighted|UIControlStateSelected)];
    
    // Button 2
    UIButton *buttonStar = [[UIButton alloc] init];
    buttonStar.layer.borderColor = RGBA(253, 134, 111, 1).CGColor;
    buttonStar.layer.borderWidth = 2;
    UIImage *buttonStarImageNormal = [UIImage imageNamed:@"clock-ico"];
    UIImage *buttonStarImageSelect = [UIImage imageNamed:@"clock-ico_selected@3x"];
    
    [buttonStar setTitle:@"试吃历史" forState:UIControlStateNormal];
    [buttonStar setTitleColor:RGBA(253, 134, 111, 1) forState:UIControlStateNormal];
    [buttonStar setTitleColor:RGBA(245, 241, 239, 1) forState:UIControlStateSelected];
    [buttonStar setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonStar.titleLabel setShadowOffset:CGSizeMake(0.0, 1.0)];
    [buttonStar.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0]];
    [buttonStar setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 5.0, 0.0, 0.0)];
    
    [buttonStar setBackgroundImage:buttonBackgroundImagePressedCenter forState:UIControlStateHighlighted];
    [buttonStar setBackgroundImage:buttonBackgroundImagePressedCenter forState:UIControlStateSelected];
    [buttonStar setBackgroundImage:buttonBackgroundImagePressedCenter forState:(UIControlStateHighlighted|UIControlStateSelected)];
    [buttonStar setImage:buttonStarImageNormal forState:UIControlStateNormal];
    [buttonStar setImage:buttonStarImageSelect forState:UIControlStateSelected];
    [buttonStar setImage:buttonStarImageNormal forState:UIControlStateHighlighted];
    [buttonStar setImage:buttonStarImageNormal forState:(UIControlStateHighlighted|UIControlStateSelected)];
    
    [_segmentedControl setButtonsArray:@[buttonSocial, buttonStar]];

}

-(void)selectLeftAction:(id)sender
{
    NSLog(@"leftClick");
    [[AppDelegate mainDelegate].slideMenuVC toggleMenu];
}


-(void)selectRightAction:(id)sender
{
    SettingViewController *settingController = [[SettingViewController alloc]init];
    settingController.isMenu = NO;
    [self.navigationController pushViewController:settingController animated:YES];
    NSLog(@"rightClick");
}

#pragma mark ----- UITableViewDatabase
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifier = @"mainTableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOffset  = scrollView.contentOffset.y;
    CGFloat xOffset = (yOffset + BackGroupHeight)/2;
    
    if (yOffset < -BackGroupHeight) {
        
        CGRect rect = imageBG.frame;
        rect.origin.y = yOffset;
        rect.size.height =  -yOffset ;
        rect.origin.x = xOffset;
        rect.size.width = screen_width + fabs(xOffset)*2;
        
        imageBG.frame = rect;
    }
    
    CGFloat alpha = (yOffset+BackGroupHeight)/BackGroupHeight;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:RGB(253, 134, 111)] forBarMetrics:UIBarMetricsDefault];
   // titleLabel.alpha=alpha;
    alpha=fabs(alpha);
    alpha=fabs(1-alpha);
    
    alpha=alpha<0.2? 0:alpha-0.2;
    
    
    BGView.alpha=alpha;

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
