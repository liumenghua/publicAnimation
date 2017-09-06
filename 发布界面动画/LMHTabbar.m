//
//  LMHTabbar.m
//  发布界面动画
//
//  Created by 刘梦桦 on 2017/9/6.
//  Copyright © 2017年 lmh. All rights reserved.
//

#import "LMHTabbar.h"
#import "UIView+Extension.h"
#import "PublishViewController.h"

@interface LMHTabbar()
/** 发布按钮 */
@property (nonatomic, weak) UIButton * publishBtn;
@end

@implementation LMHTabbar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 设置tabbar的子控件
        UIButton * publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishBtn addTarget:self action:@selector(publishBtnClick) forControlEvents:UIControlEventTouchUpInside];
        publishBtn.size = publishBtn.currentBackgroundImage.size;
        
        [self addSubview:publishBtn];
        self.publishBtn = publishBtn;
    }
    return self;
}

- (void)publishBtnClick{
    
    PublishViewController * publishVC = [[PublishViewController alloc]init];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:publishVC animated:YES completion:nil];
}

/**
 * 重写layoutSubviews方法进行布局
 */
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat width = self.width;
    CGFloat height = self.height;
    
    // 设置发布按钮的frame - 在tabbar的中心位置
    self.publishBtn.center = CGPointMake(width * 0.5, height * 0.5);
    
    // 设置其他的UITabBarButton的frame
    CGFloat buttonY = 0;
    CGFloat buttonW = width/5; // 由于tabbar上有5个UITabBarButton,所以均分5份,根据UITabBarButton的数量来定
    CGFloat buttonH = height;
    NSInteger index = 0;
    
    for (UIControl * button in self.subviews) {  // 遍历UITabBar中的所有子控件进行布局
        
        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
        CGFloat buttonX = buttonW * (index > 1? (index +1): index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        index ++;
    }
}

@end
