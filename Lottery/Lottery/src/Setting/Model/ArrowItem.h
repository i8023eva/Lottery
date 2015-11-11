//
//  ArrowItem.h
//  Lottery
//
//  Created by lyh on 15/11/10.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "EVASettingItem.h"

/**
 *  普通模型
 */
@interface ArrowItem : EVASettingItem

@property (nonatomic, assign) Class destVcClass;  //需要 push 的控制器类型

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;
@end
