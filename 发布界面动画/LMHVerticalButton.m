//
//  LMHVerticalButton.m
//  发布界面动画
//
//  Created by 刘梦桦 on 2017/9/6.
//  Copyright © 2017年 lmh. All rights reserved.
//

#import "LMHVerticalButton.h"
#import "UIView+Extension.h"

@implementation LMHVerticalButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    // 调整图片
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.height;
    
    // 调整文字
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
    
    // 设置文字居中
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
}

@end
