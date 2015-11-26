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

const CGFloat BackGroupHeight = 150;

@interface PersonageViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>{
    UITableView *_tableView;
    
    UIImageView *imageBG;
    PersonageBgView *BGView;
    
    UIButton *leftBtn;
    UIButton *rightBtn;
}

@end

@implementation PersonageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:241.0/255.0 blue:239.0/255.0 alpha:1.0];
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];

    self.title = @"个人中心";
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,[UIFont fontWithName:@"Marion-Italic" size:20.0],UITextAttributeFont,nil];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:253.0/255.0 green:134.0/255.0 blue:111.0/255.0 alpha:1.0];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"菜单" style:UIBarButtonItemStyleDone target:self action:@selector(selectLeftAction:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(selectRightAction:)];
    
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
    
}

-(void)selectLeftAction:(id)sender
{
    NSLog(@"leftClick");
    [[AppDelegate mainDelegate].slideMenuVC toggleMenu];
}


-(void)selectRightAction:(id)sender
{
    SettingViewController *settingController = [[SettingViewController alloc]init];
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
