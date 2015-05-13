//
//  ViewController.m
//  QQZone
//
//  Created by Duomai on 15/5/12.
//  Copyright (c) 2015年 zpf. All rights reserved.
//

#import "ViewController.h"
#import "QQLeftView.h"
#import "UIView+Extension.h"
#import "Const.h"
#import "Masonry.h"
#import "UIView+AutoLayout.h"
#define HMColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define HMRandomColor HMColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))
@interface ViewController ()
@property(nonatomic,weak)QQLeftView * leftView;
@property(nonatomic,strong)UIViewController * viewController;
@end

@implementation ViewController
-(QQLeftView*)leftView{
    if (_leftView == nil) {
        QQLeftView * leftView = [[QQLeftView alloc]init];
        leftView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:leftView];
        self.leftView = leftView;
    }
    return _leftView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
    self.view.backgroundColor = [UIColor colorWithRed:55/255.0 green:55/255.0 blue:55/255.0 alpha:1.0];
    // 监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarDidSelect:) name:@"DidSelect" object:nil];
    
    [self setupChildVC];
}

-(void)setupChildVC{
    for (int index = 0; index <= 5 ;index++) {
        UIViewController * viewController = [[UIViewController alloc] init];
         viewController.view.backgroundColor = HMRandomColor;
        [self addChildViewController:viewController];
    }
    
    [self switchChildVC:0];
}

-(void)switchChildVC:(NSInteger)index{
    [self.viewController.view removeFromSuperview];
    UIViewController * selectedVC = self.childViewControllers[index];
    [self.view addSubview:selectedVC.view];
    self.viewController = selectedVC;
    
    [selectedVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.leftView.mas_right);
    }];
}

-(void)tabBarDidSelect:(NSNotification*)note{
    NSDictionary * dict = note.userInfo;
    NSInteger count = [dict[@"KTag"] integerValue];
    [self switchChildVC:count];
}


-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) { //横屏
        self.leftView.width = 210;
        self.leftView.height = KScreenPortaitW;
    }else{
        self.leftView.width = 70;
        self.leftView.height = KScreenLandScapeW;
    }
}




@end
