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
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.commodityImageView = [UIImageView new];
        [self.contentView addSubview:_commodityImageView];
        [_commodityImageView mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.and.left.and.right.equalTo(self.contentView).offset(0);
            make.height.mas_equalTo(@250);
        }];
        _commodityImageView.image = [UIImage imageNamed:@"advert2"];
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
