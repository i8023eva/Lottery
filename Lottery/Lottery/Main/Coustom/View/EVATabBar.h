//
//  EVATabBar.h
//  Lottery
//
//  Created by lyh on 15/11/8.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^EVATabBarBlock)(NSInteger selectedIndex);
@interface EVATabBar : UIView

@property (nonatomic, copy) EVATabBarBlock block;
@end
