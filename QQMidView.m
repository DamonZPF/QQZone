//
//  QQMidView.m
//  QQZone
//
//  Created by Duomai on 15/5/12.
//  Copyright (c) 2015年 zpf. All rights reserved.
//

#import "QQMidView.h"
#import "Const.h"
#import "CustomButton.h"
@interface QQMidView()
@property(nonatomic,weak)CustomButton * selectedButton;
@end

@implementation QQMidView

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        // 创建按钮
        CustomButton * firstButton =    [self setupButton:@"tabbar_photo" title:@"a"];
        firstButton.enabled = NO;
        self.selectedButton = firstButton;
        
        [self setupButton:@"tabbar_mood" title:@"adfadf"];
        [self setupButton:@"tabbar_blog" title:@"a"];
        // 创建按钮
        [self setupButton:@"tabbar_photo" title:@"aaa"];
        [self setupButton:@"tabbar_mood" title:@"ddda"];
        [self setupButton:@"tabbar_blog" title:@"adddd"];
     
    }
    
    return self;
}

-(CustomButton*)setupButton:(NSString*)icon title:(NSString*)title{
    
    CustomButton * button = [[CustomButton alloc] init];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
     [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
    return button;
}

-(void)buttonClick:(CustomButton*)btn{
    
    self.selectedButton.enabled = YES;
    btn.enabled = NO;
    self.selectedButton = btn;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"DidSelect" object:nil userInfo:@{@"KTag":[NSNumber numberWithInt:btn.tag]}];

    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    int count = self.subviews.count;
    CGFloat y = 0;
    for (int i = 0; i < count; i++) {
        UIButton * btn = self.subviews[i];
        btn.frame = CGRectMake(0, y, self.width, self.height/count);
        btn.tag = i;
        y += btn.height;
    }
    
    
}

@end
