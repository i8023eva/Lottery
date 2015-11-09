//
//  EVASettingItem.m
//  Lottery
//
//  Created by lyh on 15/11/9.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "EVASettingItem.h"

@implementation EVASettingItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title {
    EVASettingItem *item = [[self alloc]init];
    
    item.title = title;
    item.icon = icon;
    
    return item;
}
@end
