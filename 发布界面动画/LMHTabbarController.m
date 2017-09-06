//
//  LMHTabbarController.m
//  发布界面动画
//
//  Created by 刘梦桦 on 2017/9/6.
//  Copyright © 2017年 lmh. All rights reserved.
//

#import "LMHTabbarController.h"
#import "LMHTabbar.h"

@interface LMHTabbarController ()

@end

@implementation LMHTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 通过appearance统一设置UITabbarItem的文字属性
    NSMutableDictionary * attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12.0];  // 设置文字大小
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];  // 设置文字的前景色
    
    NSMutableDictionary * selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem * item = [UITabBarItem appearance];  // 设置appearance
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    
    // 添加控制器
    [self setupChildVC:[[UIViewController alloc] init] andTitle:@"模块1" andImage:@"tabBar_essence_icon" andSelectImage:@"tabBar_essence_click_icon"];
    [self setupChildVC:[[UIViewController alloc] init] andTitle:@"模块2" andImage:@"tabBar_new_icon" andSelectImage:@"tabBar_new_click_icon"];
    [self setupChildVC:[[UIViewController alloc] init] andTitle:@"模块3" andImage:@"tabBar_friendTrends_icon" andSelectImage:@"tabBar_friendTrends_click_icon"];
    [self setupChildVC:[[UIViewController alloc] init] andTitle:@"模块4" andImage:@"tabBar_me_icon" andSelectImage:@"tabBar_me_click_icon"];
    
    // 更换tabbar
    [self setValue:[[LMHTabbar alloc]init] forKey:@"tabBar"];
    
}


/**
 * 初始化子控制器
 */
- (void)setupChildVC:(UIViewController *)vc andTitle:(NSString * )title andImage:(NSString * )image andSelectImage:(NSString *)selectImage{
    
    // 设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    
    // 包装一个导航控制器
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
    nav.view.backgroundColor = [UIColor whiteColor];
    
    // 添加为子控制器
    [self addChildViewController:nav];
}
@end
