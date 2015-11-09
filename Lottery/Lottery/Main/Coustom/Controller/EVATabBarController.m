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
    [self.tabBar removeFromSuperview];
    
    // 创建tabBar
    EVATabBar *tabBar = [[EVATabBar alloc] init];
    
    tabBar.block = ^(NSInteger selectedIndex){
        self.selectedIndex = selectedIndex;
    };
    
//    tabBar.delegate = self;
    
    tabBar.frame = self.tabBar.frame;
    
    [self.view addSubview:tabBar];
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
