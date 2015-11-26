//
//  PersonageBgView.m
//  FreeEat
//
//  Created by mac- t4 on 15/11/26.
//  Copyright (c) 2015年 上海科文麦格里实业有限公司. All rights reserved.
//

#import "PersonageBgView.h"

const CGFloat ImageHeight = 110;

@implementation PersonageBgView

- (id)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        //头像
        self.headImageView = [[UIImageView alloc]init];
        _headImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        _headImageView.layer.borderWidth = 5;
        _headImageView.layer.cornerRadius = 55;
        _headImageView.layer.masksToBounds = YES;
        _headImageView.image=[UIImage imageNamed:@"0"];
        _headImageView.frame=CGRectMake(30, 20, ImageHeight, ImageHeight);
        [self addSubview:_headImageView];
        
        //用户名
        self.nameLabel = [[UILabel alloc]init];
        _nameLabel.text=@"Nalevy";
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont boldSystemFontOfSize:20];
        _nameLabel.frame=CGRectMake(50+ImageHeight, 40, ImageHeight, 20);
        [self addSubview:_nameLabel];
        
        //加入时间
        self.timeLabel=[[UILabel alloc]init];
        _timeLabel.text=@"2015-11-26 加入";
        _timeLabel.backgroundColor = [UIColor clearColor];
        _timeLabel.textColor = [UIColor whiteColor];
        _timeLabel.font = [UIFont boldSystemFontOfSize:13];
        _timeLabel.frame=CGRectMake(50+ImageHeight, 60, ImageHeight, 20);
        [self addSubview:_timeLabel];
        
        //试吃数量
        self.numUserApplyLabel = [[UILabel alloc]init];
        _numUserApplyLabel.text=@"试吃2份";
        _numUserApplyLabel.backgroundColor = [UIColor clearColor];
        _numUserApplyLabel.textColor = [UIColor whiteColor];
        _numUserApplyLabel.font = [UIFont boldSystemFontOfSize:13];
        _numUserApplyLabel.frame=CGRectMake(50+ImageHeight, 80, ImageHeight/2, 20);
        [self addSubview:_numUserApplyLabel];
        
        //食评数量
        self.evaluateLabel = [[UILabel alloc]init];
        _evaluateLabel.text=@"食评1篇";
        _evaluateLabel.backgroundColor = [UIColor clearColor];
        _evaluateLabel.textColor = [UIColor whiteColor];
        _evaluateLabel.font = [UIFont boldSystemFontOfSize:13];
        _evaluateLabel.frame=CGRectMake(50+ImageHeight*3/2, 80, ImageHeight, 20);
        [self addSubview:_evaluateLabel];

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
