//
//  MainTableViewCell.m
//  FreeEat
//
//  Created by mac- t4 on 15/11/26.
//  Copyright (c) 2015年 上海科文麦格里实业有限公司. All rights reserved.
//

#import "MainTableViewCell.h"

@interface MainTableViewCell ()

@end


@implementation MainTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = RGBA(245, 241, 239, 1);
        self.commodityImageView = [UIImageView new];
        [self.contentView addSubview:_commodityImageView];
        [_commodityImageView mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.and.left.and.right.equalTo(self.contentView).offset(0);
            make.height.mas_equalTo(@250);
        }];
        
        UIView *view = [UIView new];
        [self.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.and.bottom.right.equalTo(self.commodityImageView).offset(0);
            make.height.mas_equalTo(@50);
        }];
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.3;
        
        self.commodityName = [UILabel new];
        _commodityName.textColor = [UIColor whiteColor];
        _commodityName.textAlignment = NSTextAlignmentCenter;
        _commodityName.font = [UIFont boldSystemFontOfSize:20];
        [self.commodityImageView addSubview:_commodityName];
        [_commodityName mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.and.bottom.right.equalTo(self.commodityImageView).offset(0);
            make.height.mas_equalTo(@50);
        }];
        
        
        UIView *informationBar = [UIView new]; //信息条
        informationBar.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:informationBar];
        [informationBar mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_commodityImageView.mas_bottom).offset(0);
            make.left.and.right.equalTo(self.contentView).offset(0);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
        
        self.classifyImageView = [UIImageView new];  //分类图标
        _classifyImageView.image = [UIImage imageNamed:@"new-ico"];
        [informationBar addSubview:_classifyImageView];
        
        self.classifyLabel = [UILabel new]; //分类
        _classifyLabel.text = @"新品";
        [informationBar addSubview:_classifyLabel];
        
        UIImageView *priceImageView = [UIImageView new]; //价格图标
        priceImageView.image = [UIImage imageNamed:@"price-ico"];
        [informationBar addSubview:priceImageView];
        
        self.priceLabel = [UILabel new];   //价格
        _priceLabel.font = [UIFont boldSystemFontOfSize:20];
        _priceLabel.text = @"0.00";
        [informationBar addSubview:_priceLabel];
        
        UIImageView *distanceImageView = [UIImageView new]; //距离图标
        distanceImageView.image = [UIImage imageNamed:@"distance-ico"];
        [informationBar addSubview:distanceImageView];
        
        self.distanceLabel = [UILabel new]; //距离
        _distanceLabel.textColor = [UIColor grayColor];
        _distanceLabel.font = [UIFont boldSystemFontOfSize:15];
        _distanceLabel.text = @"距离900米";
        [informationBar addSubview:_distanceLabel];
        
        [_classifyImageView mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_commodityImageView.mas_bottom).offset(10);
            make.left.equalTo(informationBar).offset(10);
            make.right.equalTo(self.classifyLabel.mas_left).offset(-10);
            make.bottom.equalTo(informationBar).offset(-10);
            make.width.mas_equalTo(@30);
        }];
        
        [_classifyLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_commodityImageView.mas_bottom).offset(0);
            make.left.equalTo(_classifyImageView.mas_right).offset(10);
            make.right.equalTo(priceImageView.mas_left).offset(-20);
            make.bottom.equalTo(informationBar).offset(0);
            make.width.mas_equalTo(@60);
        }];
        
        [priceImageView mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_commodityImageView.mas_bottom).offset(10);
            make.left.equalTo(_classifyLabel.mas_right).offset(20);
            make.right.equalTo(self.priceLabel.mas_left).offset(-10);
            make.bottom.equalTo(informationBar).offset(-10);
            make.width.mas_equalTo(@30);
        }];
        
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_commodityImageView.mas_bottom).offset(0);
            make.left.equalTo(priceImageView.mas_right).offset(10);
            make.right.equalTo(distanceImageView.mas_left).offset(-20);
            make.bottom.equalTo(informationBar).offset(0);
            make.width.mas_equalTo(@60);
        }];
        
        [distanceImageView mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_commodityImageView.mas_bottom).offset(10);
            make.left.equalTo(self.priceLabel.mas_right).offset(20);
            make.right.equalTo(_distanceLabel.mas_left).offset(-5);
            make.bottom.equalTo(informationBar).offset(-10);
            make.width.mas_equalTo(@30);
        }];
        
        [_distanceLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_commodityImageView.mas_bottom).offset(10);
            make.left.equalTo(distanceImageView.mas_right).offset(5);
            make.right.equalTo(informationBar).offset(-10);
            make.bottom.equalTo(informationBar).offset(0);
        }];
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
