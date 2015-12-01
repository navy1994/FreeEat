//
//  MainTableViewCell.h
//  FreeEat
//
//  Created by mac- t4 on 15/11/26.
//  Copyright (c) 2015年 上海科文麦格里实业有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *commodityImageView;
@property (nonatomic, strong) UILabel *commodityName;
@property (nonatomic, strong) UILabel *classifyLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *distanceLabel;

@end
