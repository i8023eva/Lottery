//
//  ArrowItem.m
//  Lottery
//
//  Created by lyh on 15/11/10.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "ArrowItem.h"

@implementation ArrowItem
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass {
    ArrowItem *item = [super itemWithIcon:icon title:title];
    
    item.destVcClass = destVcClass;;
    return item;
}
@end
