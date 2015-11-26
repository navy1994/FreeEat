//
//  MenuHeaderView.m
//  FreeEat
//
//  Created by mac- t4 on 15/11/26.
//  Copyright (c) 2015年 上海科文麦格里实业有限公司. All rights reserved.
//

#import "MenuHeaderView.h"

const CGFloat HeadImageHeight = 80;

@implementation MenuHeaderView

- (id)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.headerImageView=[[UIImageView alloc]init];
        _headerImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        _headerImageView.layer.borderWidth = 2;
        _headerImageView.layer.cornerRadius = 40;
        _headerImageView.layer.masksToBounds = YES;
        _headerImageView.image=[UIImage imageNamed:@"0"];
        _headerImageView.frame=CGRectMake(60, 50, HeadImageHeight, HeadImageHeight);
        [self addSubview:_headerImageView];
        
        self.userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(_headerImageView.frame.origin.x, 50+HeadImageHeight, _headerImageView.frame.size.width, 40)];
        _userNameLabel.textAlignment = NSTextAlignmentCenter;
        _userNameLabel.font = [UIFont boldSystemFontOfSize:18];
        _userNameLabel.text = @"Nalevy";
        _userNameLabel.textColor = [UIColor grayColor];
        [self addSubview:_userNameLabel];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
