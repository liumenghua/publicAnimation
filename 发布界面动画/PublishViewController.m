//
//  PublishViewController.m
//  发布界面动画
//
//  Created by 刘梦桦 on 2017/9/6.
//  Copyright © 2017年 lmh. All rights reserved.
//

#import "PublishViewController.h"
#import <POP.h>
#import "LMHVerticalButton.h"
#import "UIView+Extension.h"

#define  ScreenH [UIScreen mainScreen].bounds.size.height
#define  ScreenW [UIScreen mainScreen].bounds.size.width

static CGFloat const animationDelay = 0.1;


@interface PublishViewController ()

@end

@implementation PublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self animationBaiSi];
    
//    [self animationWeiBo];

}

/**
 * 百思不得姐发布效果
 */
- (void)animationBaiSi{
    
    // 1.让控制器的view不能点击
    self.view.userInteractionEnabled = NO;
    
    // 2. 数据
    NSArray *images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    NSArray *titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"离线下载"];
    
    // 3.设置中间的按钮 这里是6个 当然也可以是服务器返回的数量 但是计算方法都一样
    int maxCols = 3;  // 一排最多三个
    CGFloat btnW = 72;
    CGFloat btnH = btnW + 38;
    CGFloat btnStartY = (ScreenH - 2 * btnH) * 0.5;
    CGFloat btnStartX = 20;
    CGFloat xMargin = (ScreenW - 2 * btnStartX - maxCols * btnW) / (maxCols - 1);
    
    int index = 6;
    
    for (int i = 0; i < images.count; i++) {  // 循环添加按钮
        
        // 4.初始化按钮
        LMHVerticalButton * btn = [[LMHVerticalButton alloc]init];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        // 5. 设置按钮的内容
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        
        // 6.计算当前按钮的X/Y
        int row = i / maxCols; //所在行
        int col = i % maxCols; // 所在列
        CGFloat btnX = btnStartX + col * (xMargin + btnW);
        CGFloat btnEndY = btnStartY + row * btnH;
        CGFloat btnBeginY = btnEndY - ScreenH;
        
        // 7.给按钮添加弹簧动画
        POPSpringAnimation * anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        anim.fromValue = [NSValue valueWithCGRect:CGRectMake(btnX, btnBeginY, btnW, btnH)];
        anim.toValue = [NSValue valueWithCGRect:CGRectMake(btnX, btnEndY, btnW, btnH)];
        anim.springBounciness = 10; //springBounciness为弹簧弹力 取值范围为【0，20】， 默认为4
        anim.springSpeed = 10; //springSpeed为弹簧速度 速度越快 动画时间越短 取值范围[0,20], 默认为12 和springBounciness一起决定弹簧动画效果
        anim.beginTime = CACurrentMediaTime() + animationDelay * index; // 动画开始的时间 每个按钮的时间不同 通过这个时间来设置按钮出现的顺序
        [btn pop_addAnimation:anim forKey:nil];
        [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            // 动画执行完毕 恢复点击事件
            self.view.userInteractionEnabled = YES;
        }];
        
        index --;
    }
}

/**
 * 微博发布动画效果 其实只需要改变btnBeginY的位置
 */
- (void)animationWeiBo{
    
    // 1.让控制器的view不能点击
    self.view.userInteractionEnabled = NO;
    
    // 2. 数据
    NSArray *images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    NSArray *titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"离线下载"];
    
    // 3.设置中间的按钮 这里是6个 当然也可以是服务器返回的数量 但是计算方法都一样
    int maxCols = 3;  // 一排最多三个
    CGFloat btnW = 72;
    CGFloat btnH = btnW + 38;
    CGFloat btnStartY = (ScreenH - 2 * btnH) * 0.5;
    CGFloat btnStartX = 20;
    CGFloat xMargin = (ScreenW - 2 * btnStartX - maxCols * btnW) / (maxCols - 1);
    
    for (int i = 0; i < images.count; i++) {  // 循环添加按钮
        
        // 4.初始化按钮
        LMHVerticalButton * btn = [[LMHVerticalButton alloc]init];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        // 5. 设置按钮的内容
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        
        // 6.计算当前按钮的X/Y
        int row = i / maxCols; //所在行
        int col = i % maxCols; // 所在列
        CGFloat btnX = btnStartX + col * (xMargin + btnW);
        CGFloat btnEndY = btnStartY + row * btnH;
        CGFloat btnBeginY =ScreenH + btnEndY;
        
        // 7.给按钮添加弹簧动画
        POPSpringAnimation * anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        anim.fromValue = [NSValue valueWithCGRect:CGRectMake(btnX, btnBeginY, btnW, btnH)];
        anim.toValue =   [NSValue valueWithCGRect:CGRectMake(btnX, btnEndY, btnW, btnH)];
        anim.springBounciness = 10; //springBounciness为弹簧弹力 取值范围为【0，20】， 默认为4
        anim.springSpeed = 10; //springSpeed为弹簧速度 速度越快 动画时间越短 取值范围[0,20], 默认为12 和springBounciness一起决定弹簧动画效果
        anim.beginTime = CACurrentMediaTime() + animationDelay * i;  // 开始时间添加延迟
        [btn pop_addAnimation:anim forKey:nil];
        [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            // 动画执行完毕 恢复点击事件
            self.view.userInteractionEnabled = YES;
        }];
    }
}

/**
 * 按钮点击事件
 */
- (void)btnClick:(UIButton *)button{
    
    [self cancelWithCompletionBlock:^{
        
        switch (button.tag) {
            case 0:
                NSLog(@"发视屏");
                break;
            case 1:
                NSLog(@"发图片");
                break;
            case 2:
                NSLog(@"发段子");
                break;
            case 3:
                NSLog(@"发声音");
                break;
            case 4:
                NSLog(@"发连接");
                break;
            case 5:
                NSLog(@"音乐相册");
                break;
            default:
                break;
        }
    }];
}

/**
 * 取消按钮的点击事件
 */
- (IBAction)btnCancelClick:(id)sender {
    [self cancelWithCompletionBlock:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self cancelWithCompletionBlock:nil];
}

/**
 * 先执行退出动画 动画执行完毕再执行completionBlock - 微博
 */
- (void)cancelWithCompletionBlock:(void(^)())completionBlock{
    
    // 让控制器的view不能点击
    self.view.userInteractionEnabled = NO;
    
    int index = 0; // 索引 用来设置按钮动画的延迟时间
    
    for ( int i = (int)self.view.subviews.count - 1; i > 0; i--) {
        
        UIView * subview = self.view.subviews[i];
        
        // 基本动画
        POPBasicAnimation * anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        CGFloat centerY = subview.centerY + ScreenH;
        
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(subview.centerX, centerY)];
        anim.beginTime = CACurrentMediaTime() + index * animationDelay;
        
        index ++;
        
        [subview pop_addAnimation:anim forKey:nil];
        
        // 监听最后一个动画
        if (i == 1) {
            [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished){
                
                [self dismissViewControllerAnimated:NO completion:nil];
                
                !completionBlock ? : completionBlock();
            }];
        }
    }
}


@end
