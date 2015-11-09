//
//  EVATabBarController.m
//  Lottery
//
//  Created by lyh on 15/11/8.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "EVATabBarController.h"
#import "EVATabBar.h"

@interface EVATabBarController ()

@end

@implementation EVATabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 移除自带的tabBar
//    [self.tabBar removeFromSuperview];
    
    // 创建tabBar
    EVATabBar *tabBar = [[EVATabBar alloc] init];
    
    tabBar.block = ^(NSInteger selectedIndex){
        self.selectedIndex = selectedIndex;
    };
    
//    tabBar.delegate = self;
    //因为是自定义tabbar , 不是系统的, 选择 hide bottom bar on push , 需要添加在 self.tabbar 上
    tabBar.frame = self.tabBar.bounds;
    
    [self.tabBar addSubview:tabBar];
    
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *imageName = [NSString stringWithFormat:@"TabBar%lu",idx + 1];
        NSString *selImageName = [NSString stringWithFormat:@"TabBar%luSel",idx + 1];
        
        [tabBar addTabBarButtonWithImageName:imageName selImageName:selImageName];
    }];
    
    UINavigationBar *bar = [UINavigationBar appearance];
    
    UIImage *navImage = nil;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
        navImage = [UIImage imageNamed:@"NavBar64"];
    }else{
        navImage = [UIImage imageNamed:@"NavBar"];
    }
    [bar setBackgroundImage:navImage forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
