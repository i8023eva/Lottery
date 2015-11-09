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

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = YES;
    
    return [super pushViewController:viewController animated:animated];
}

@end
