//
//  ForetasteCollectionViewCell.m
//  FreeEat
//
//  Created by mac- t4 on 15/11/26.
//  Copyright (c) 2015年 上海科文麦格里实业有限公司. All rights reserved.
//

#import "ForetasteCollectionViewCell.h"

@implementation ForetasteCollectionViewCell
- (id)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 5;
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        self.commodityImageView = [UIImageView new];
        [self.contentView addSubview:_commodityImageView];
        [_commodityImageView mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.and.left.and.right.equalTo(self.contentView).offset(0);
            make.height.mas_equalTo(@180);
        }];
        _commodityImageView.image = [UIImage imageNamed:@"advert2"];
        UIView *view = [UIView new];
        [self.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.and.bottom.right.equalTo(self.commodityImageView).offset(0);
            make.height.mas_equalTo(@40);
        }];
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.3;
        
        self.commodityName = [UILabel new];
        _commodityName.textColor = [UIColor whiteColor];
        _commodityName.textAlignment = NSTextAlignmentCenter;
        _commodityName.font = [UIFont boldSystemFontOfSize:18];
        [self.commodityImageView addSubview:_commodityName];
        [_commodityName mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.and.bottom.right.equalTo(self.commodityImageView).offset(0);
            make.height.mas_equalTo(@40);
        }];
        _commodityName.text = @"循疾问食｜商品名";
        
        self.commodityNumber = [UILabel new];
        _commodityNumber.font = [UIFont boldSystemFontOfSize:15];
        [self.contentView addSubview:_commodityNumber];
        
        UIImageView *clockImageView = [UIImageView new];
        clockImageView.image = [UIImage imageNamed:@"clock-ico"];
        [self.contentView addSubview:clockImageView];
        
        self.commodityTime = [UILabel new];
        [self.contentView addSubview:_commodityTime];
        
        [_commodityNumber mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(self.contentView).offset(5);
            make.top.equalTo(self.commodityImageView.mas_bottom).offset(0);
            make.height.mas_equalTo(@30);
            make.width.mas_equalTo(@60);
        }];
        _commodityNumber.text = @"免费5份";
        
        [clockImageView mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(_commodityNumber.mas_right).offset(10);
            make.right.equalTo(self.commodityTime.mas_left).offset(-5);
            make.centerY.mas_equalTo(_commodityNumber.mas_centerY);
            make.width.mas_equalTo(@20);
            make.height.mas_equalTo(@20);
        }];
        
        
        [_commodityTime mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(clockImageView.mas_right).offset(5);
            make.right.equalTo(self.contentView).offset(5);
            make.centerY.mas_equalTo(_commodityNumber.mas_centerY);
            make.height.mas_equalTo(_commodityNumber.mas_height);
        }];
        self.commodityTime.text = @"5天12时30分";
        self.commodityTime.textColor = [UIColor grayColor];
        self.commodityTime.font = [UIFont boldSystemFontOfSize:12];
        
        self.applyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_applyBtn];
        [_applyBtn mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_commodityNumber.mas_bottom).offset(5);
            make.left.equalTo(self.contentView).offset(10);
            make.right.equalTo(self.contentView).offset(-10);
            make.height.mas_equalTo(@30);
        }];
        [_applyBtn setTitle:@"申请试吃" forState:UIControlStateNormal];
        [_applyBtn setBackgroundColor:RGB(253, 134, 111)];
        _applyBtn.layer.cornerRadius = 8;
        _applyBtn.layer.masksToBounds = YES;
        
        
    }
    return self;
}


@end
