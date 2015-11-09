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

/**
 *  给外界创建按钮  根据子控制器的数量创建
 *
 *  @param name    <#name description#>
 *  @param selName <#selName description#>
 */
- (void)addTabBarButtonWithImageName:(NSString *)name selImageName:(NSString *)selName;
@end
