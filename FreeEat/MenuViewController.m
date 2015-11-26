//
//  MenuViewController.m
//  FreeEat
//
//  Created by mac- t4 on 15/11/25.
//  Copyright (c) 2015年 上海科文麦格里实业有限公司. All rights reserved.
//

#import "MenuViewController.h"
#import <HKSlideMenu3DController.h>
#import "AppDelegate.h"
#import "MenuHeaderView.h"
#import "ForetasteViewController.h"
#import "PersonageViewController.h"
#import "SettingViewController.h"

@interface MenuViewController ()<UITableViewDataSource,UITableViewDelegate,HKSlideMenu3DControllerDelegate>{
    NSArray *images;
    NSArray *titles;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MenuHeaderView *menuHeaderView;
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    titles = @[@"推荐",@"试吃",@"个人",@"设置",@"注销"];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView reloadData];
    [self.view addSubview:self.tableView];
    
    self.menuHeaderView = [[MenuHeaderView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 250)];
    self.tableView.tableHeaderView = self.menuHeaderView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return titles.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"CellIdentifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [titles objectAtIndex:indexPath.row];
    
    UIFont *currentFont = cell.textLabel.font;
    UIFont *correctFont = [UIFont fontWithName:currentFont.fontName size:currentFont.pointSize+5];
    cell.textLabel.font = correctFont;
    
    cell.textLabel.textColor = [UIColor grayColor];
//    cell.imageView.image = [UIImage imageNamed:[images objectAtIndex:indexPath.row]];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell setBackgroundColor:[UIColor clearColor]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [[AppDelegate mainDelegate] ChageViewController:indexPath];
}

#pragma mark HKSlideMenu3DControllerDelegate methods
-(void)willOpenMenu{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

-(void)didOpenMenu{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

-(void)willCloseMenu{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

-(void)didCloseMenu{
    NSLog(@"%s", __PRETTY_FUNCTION__);
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
