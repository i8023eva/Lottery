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
        // 获取应用程序中所有的导航条
        // 获取所有导航条外观
        UINavigationBar *bar = [UINavigationBar appearance];
        
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
    }
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = YES;
    
    return [super pushViewController:viewController animated:animated];
}

@end
