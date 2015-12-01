//
//  LocationCityViewController.m
//  FreeEat
//
//  Created by mac- t4 on 15/12/1.
//  Copyright (c) 2015年 上海科文麦格里实业有限公司. All rights reserved.
//

#import "LocationCityViewController.h"
#import "CityLocationManager.h"
#import "CityInfo.h"
#import "CityLocation.h"

@interface LocationCityViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UITableView *tableList;
@property (nonatomic, strong) NSMutableDictionary *cityInfoDic;
@property (nonatomic, strong) NSMutableArray *sectionTitlesArr;
@property (nonatomic, strong) CityLocation *cityLocation;
@property (nonatomic, assign) CityLocationStatus cityLocationStatus;
@property (nonatomic, strong) CityInfo *cityInfo;

@end

@implementation LocationCityViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self initData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.title = @"城市定位和选择";
    
    self.searchBar = [UISearchBar new];
    _searchBar.placeholder = @"输入城市名或拼音查询";
    [self.view addSubview:_searchBar];
    
    self.tableList = [UITableView new];
    _tableList.sectionIndexColor = RGBA(253, 134, 111, 1);
    _tableList.dataSource = self;
    _tableList.delegate = self;
    [self.view addSubview:_tableList];
    
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.and.left.and.right.equalTo(self.view).offset(0);
        make.bottom.equalTo(_tableList.mas_top).offset(-5);
    }];
    
    [_tableList mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.searchBar.mas_bottom).offset(5);
        make.left.and.right.and.bottom.equalTo(self.view).offset(0);
    }];
    
     [self startLocation];
    
}

- (void)startLocation {
    __weak typeof(self) this = self;
    [self.cityLocation locationForCityInfo:^(CityLocationStatus status, CityInfo *cityInfo) {
        NSLog(@"status--->>%ld",(long)status);
        if (status == CityLocationForIng) {
            NSLog(@"定位中");
        } else if (status == CityLocationForFailForNoPermission) {
            NSLog(@"暂无地理位置权限，请检查");
        } else if (status == CityLocationForSuccussWithoutCityInfo) {
            NSLog(@"定位成功，但是不在当且城市列表");
        } else if (status == CityLocationForFailForNoNet) {
            NSLog(@"定位成功，但是请求失败");
        } else if (status == CityLocationForSuccussWithCityInfo) {
            NSLog(@"定位成功");
        } else if (status == CityLocationForFailForGps) {
            NSLog(@"定位失败，但是请求失败");
        }
        
        if (status != this.cityLocationStatus) {
            this.cityInfo = cityInfo;
            this.cityLocationStatus = status;
            [this.tableList reloadData];
        }
        
    }];
}


- (void)initData {
    self.cityLocationStatus = CityLocationForIng;
    self.sectionTitlesArr = [NSMutableArray arrayWithArray:[[CityLocationManager shareInstance] allCitySectionTitles]];
    self.cityInfoDic = [NSMutableDictionary dictionaryWithDictionary:[[CityLocationManager shareInstance] allCityInfo]];
}


#pragma mark ----- UITableViewDatabase
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionTitlesArr.count + 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"";
    }
    
    return [self.sectionTitlesArr objectAtIndex:section-1];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    
    NSArray *cityArr = [self.cityInfoDic objectForKey:[self.sectionTitlesArr objectAtIndex:section-1]];
    return cityArr.count;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.sectionTitlesArr;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    
    if (indexPath.section == 0) {
        if (self.cityLocationStatus == CityLocationForIng) {
            cell.textLabel.text = @"正在查找...";
        } else if (self.cityLocationStatus == CityLocationForSuccussWithCityInfo) {
            cell.textLabel.text = [NSString stringWithFormat:@"%@",self.cityInfo.cityName];
        } else if (self.cityLocationStatus == CityLocationForSuccussWithoutCityInfo) {
            cell.textLabel.text = @"你不在当前城市列表";
        } else if (self.cityLocationStatus == CityLocationForFailForNoPermission) {
            cell.textLabel.text = @"请打开地理位置权限";
        } else if (self.cityLocationStatus == CityLocationForFailForNoNet) {
            cell.textLabel.text = @"定位失败，请重试";
        } else if (self.cityLocationStatus == CityLocationForFailForGps) {
            cell.textLabel.text = @"定位失败，请重试";
        }
        cell.imageView.image = [UIImage imageNamed:@"distance-ico"];
    } else {
        NSArray *cityArr = [self.cityInfoDic objectForKey:[self.sectionTitlesArr objectAtIndex:indexPath.section-1]];
        CityInfo *cityInfo = (CityInfo *)[cityArr objectAtIndex:indexPath.row];
        cell.textLabel.text = cityInfo.cityName;
    }
    
    return cell;
}

#pragma makr  - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        [self.cityLocation restartLocation];
        
        //        if (self.cityLocationStatus != CityLocationForSuccussWithCityInfo) {
        //            [self.cityLocation restartLocation];
        //        }
    }
}

- (CityLocation *)cityLocation {
    if (!_cityLocation) {
        _cityLocation = [[CityLocation alloc] init];
    }
    
    return _cityLocation;
}

//#pragma mark - get method
//- (UITableView *)tableList {
//    if (!_tableList) {
//        _tableList = [[UITableView alloc] initWithFrame:self.view.frame];
//        _tableList.sectionIndexColor = [UIColor redColor];
//        _tableList.dataSource = self;
//        _tableList.delegate = self;
//    }
//
//    return _tableList;
//};


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
