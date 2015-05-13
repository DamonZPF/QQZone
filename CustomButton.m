//
//  CustomButton.m
//  QQZone
//
//  Created by Duomai on 15/5/12.
//  Copyright (c) 2015年 zpf. All rights reserved.
//

#import "CustomButton.h"
#import "Const.h"



@implementation CustomButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateDisabled];
        self.imageView.contentMode = UIViewContentModeCenter;
        self.adjustsImageWhenDisabled = NO;
        self.adjustsImageWhenHighlighted = NO;
        
        // 设置按钮的内容向左边对齐
        //        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //        // 设置内边距
        //        CGFloat inset = 30;
        //        self.contentEdgeInsets = UIEdgeInsetsMake(0, inset, 0, 0);
        //        self.titleEdgeInsets = UIEdgeInsetsMake(0, inset, 0, 0);
    }
    return self;
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (Landscape) {
        self.imageView.height = self.height;
        self.imageView.width = self.width * 0.4;
        self.imageView.x = 0;
        self.imageView.y = 0;
        
        self.titleLabel.hidden = NO;
        self.titleLabel.y = 0;
        self.titleLabel.x = self.imageView.width;
        self.titleLabel.width = self.width - self.imageView.width;
        self.titleLabel.height = self.height;
    } else {
        self.titleLabel.hidden = YES;
        // 如果设置宽度或者高度为0,某个控件还是会显示一部分, 可以尝试设置控件的width或者height为负数
        //        self.titleLabel.frame = CGRectMake(0, 0, -1, 0);
        self.imageView.frame = self.bounds;
    }
}

@end
