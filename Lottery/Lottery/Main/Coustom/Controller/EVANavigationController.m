//
//  EVANavigationController.m
//  Lottery
//
//  Created by lyh on 15/11/9.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "EVANavigationController.h"

@interface EVANavigationController ()

@end

@implementation EVANavigationController

// 第一次使用这个类或者这个类的子类的时候
+ (void)initialize
{
    if (self == [EVANavigationController class]) { // 肯定能保证只调用一次
            // 1.设置全局导航条外观
            [self setupNav];
            
            if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) return; // 不需要设置全局barButton外观
            
            // 2.设置全局barButton外观
            [self setupBarButton];
        }
}

#pragma mark - 设置全局导航条
+ (void)setupNav
{
#warning appearance
    // 获取应用程序中所有的导航条
    // 获取所有导航条外观------不使用
    /**
     *  现在我们需要获取自己导航控制器的控制条   -----iOS7的短信问题
     */
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[EVANavigationController class]]];
    
    UIImage *navImage = nil;
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
        navImage = [UIImage imageNamed:@"NavBar64"];
    }else{
        navImage = [UIImage imageNamed:@"NavBar"];
    }
    [bar setBackgroundImage:navImage forBarMetrics:UIBarMetricsDefault];
    
    
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName : [UIColor whiteColor],
                           NSFontAttributeName : [UIFont systemFontOfSize:15]
                           };
    [bar setTitleTextAttributes:dict];
    
    // 设置导航条的主题颜色
    [bar setTintColor:[UIColor whiteColor]];
}


#pragma mark - 设置全局的UIBarButton外观
+ (void)setupBarButton
{
    // 获取所有UIBarButton的外观
    UIBarButtonItem *buttonItem = [UIBarButtonItem appearance];
    // 设置UIBarButton的背景图片
    [buttonItem setBackgroundImage:[UIImage imageNamed:@"NavButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [buttonItem setBackgroundImage:[UIImage imageNamed:@"NavButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    // 设置返回按钮的背景图片
    [buttonItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [buttonItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = YES;
    
    return [super pushViewController:viewController animated:animated];
}

@end
