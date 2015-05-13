//
//  QQLeftView.m
//  QQZone
//
//  Created by Duomai on 15/5/12.
//  Copyright (c) 2015年 zpf. All rights reserved.
//

#import "QQLeftView.h"
#import "QQHeaderView.h"
#import "QQMidView.h"
#import "QQFooterView.h"
#import "Const.h"
@interface QQLeftView()

@property(nonatomic,weak)QQHeaderView * headerView;
@property(nonatomic,weak)QQMidView * midView;
@property(nonatomic,weak)QQFooterView * footerView;

@end

@implementation QQLeftView


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.autoresizingMask = UIViewAutoresizingNone;
        QQHeaderView * headerView = [[QQHeaderView alloc]init];
        [headerView setBackgroundColor:[UIColor redColor]];
        [self addSubview:headerView];
        self.headerView = headerView;
        
        QQMidView * midView = [[QQMidView alloc]init];
        midView.backgroundColor = [UIColor clearColor];
        [self addSubview:midView];
        self.midView = midView;
        
        QQFooterView * footView = [[QQFooterView alloc]init];
        footView.backgroundColor = [UIColor clearColor];
        [self addSubview:footView];
        self.footerView = footView;
        
    }
    
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.midView.width = self.width;
    self.midView.height = self.midView.subviews.count * 70;
    
    self.footerView.width = self.width;
    if (Landscape) { //横屏
        self.headerView.width = self.width * 0.4;
        self.headerView.height = self.headerView.width + 40;
        self.headerView.x = (self.width - self.headerView.width)/2;
        self.headerView.y = 70;
        
        self.footerView.height = self.width / 3;
      
    }else{
        self.headerView.x = 5;
        self.headerView.y = 50;
        self.headerView.width = self.width - 2 * self.headerView.x;
        self.headerView.height = self.headerView.width;
        
        self.footerView.height = self.width  * 3;
        
    }
    self.footerView.y  = self.height - self.footerView.height;
    self.midView.y = self.footerView.y - self.midView.height;
    
}

@end
