//
//  EVASettingItem.h
//  Lottery
//
//  Created by lyh on 15/11/9.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum : NSUInteger {
    kEVASettingItemArrow,
    kEVASettingItemSwitch,
} EVASettingItemType;

@interface EVASettingItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;

/** 弃用 */
@property (nonatomic, assign) EVASettingItemType type;

/**
 *  添加一个 block
 */


+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;

@end
