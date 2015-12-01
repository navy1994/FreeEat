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
    //默认选中第一行
    
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
    
    if (indexPath.row) {
        cell.textLabel.textColor = [UIColor grayColor];
    }else{
        cell.textLabel.textColor = RGBA(253, 134, 111, 1);
    }
    
//    cell.imageView.image = [UIImage imageNamed:[images objectAtIndex:indexPath.row]];
    
    NSIndexPath *firstPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:firstPath animated:YES scrollPosition:UITableViewScrollPositionTop];
   
    //选中背景自定义
    cell.selectedBackgroundView=[[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor whiteColor]]];
    
    cell.contentView.backgroundColor = [UIColor clearColor];
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell setBackgroundColor:[UIColor clearColor]];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"deselect:%ld",(long)indexPath.row);
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor grayColor];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"select:%ld",(long)indexPath.row);
    //NSIndexPath *indexPath = [tableView indexPathForSelectedRow];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = RGBA(253, 134, 111, 1);
    
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
