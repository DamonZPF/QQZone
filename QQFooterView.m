//
//  QQFooterView.m
//  QQZone
//
//  Created by Duomai on 15/5/12.
//  Copyright (c) 2015年 zpf. All rights reserved.
//

#import "QQFooterView.h"
#import "Const.h"
@implementation QQFooterView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // 创建按钮
        [self setupButton:@"tabbar_photo"];
        [self setupButton:@"tabbar_mood"];
        [self setupButton:@"tabbar_blog"];
        
    }
    return self;
}

-(void)setupButton:(NSString*)icon{

    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    [self addSubview:button];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    int count = self.subviews.count;
    if (Landscape) { //横屏
        CGFloat x = 0;
        for (int i = 0; i < count; i++) {
            UIButton * btn = self.subviews[i];
            btn.frame = CGRectMake(x, 0, self.width/count, self.height);
            x += btn.width;
        }
    }else{
        CGFloat y = 0;
        for (int i = 0; i < count; i++) {
            UIButton * btn = self.subviews[i];
            btn.frame = CGRectMake(0, y, self.width, self.height/count);
            y += btn.height;
        }
        
    }
  
    
}

@end
