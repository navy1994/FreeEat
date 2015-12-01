//
//  MainTableViewCell.m
//  FreeEat
//
//  Created by mac- t4 on 15/11/26.
//  Copyright (c) 2015年 上海科文麦格里实业有限公司. All rights reserved.
//

#import "MainTableViewCell.h"

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
        //_commodityImageView.image = [UIImage imageNamed:@"advert2"];
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
        _commodityName.text = @"循疾问食｜商品名";
        
        UIView *informationBar = [UIView new];
        informationBar.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:informationBar];
        [informationBar mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_commodityImageView.mas_bottom).offset(0);
            make.left.and.right.equalTo(self.contentView).offset(0);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
        
        self.classifyLabel = [UILabel new];
        _classifyLabel.text = @"新品";
        [informationBar addSubview:_classifyLabel];
        
        self.priceLabel = [UILabel new];
        _priceLabel.text = @"0";
        [informationBar addSubview:_priceLabel];
        
        self.distanceLabel = [UILabel new];
        _distanceLabel.text = @"距离900米";
        [informationBar addSubview:_distanceLabel];
    
        
        [_classifyLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_commodityImageView.mas_bottom).offset(0);
            make.left.equalTo(informationBar).offset(5);
            make.right.equalTo(self.priceLabel.mas_left).offset(0);
            make.bottom.equalTo(informationBar).offset(0);
            make.width.mas_equalTo(self.priceLabel.mas_width);
        }];
        
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_commodityImageView.mas_bottom).offset(0);
            make.left.equalTo(self.classifyLabel.mas_right).offset(0);
            make.right.equalTo(self.distanceLabel.mas_left).offset(0);
            make.bottom.equalTo(informationBar).offset(0);
            make.width.mas_equalTo(self.distanceLabel.mas_width);
        }];
        
        [_distanceLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_commodityImageView.mas_bottom).offset(0);
            make.left.equalTo(self.priceLabel.mas_right).offset(0);
            make.right.equalTo(informationBar).offset(-5);
            make.bottom.equalTo(informationBar).offset(0);
            make.width.mas_equalTo(self.classifyLabel.mas_width);
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
