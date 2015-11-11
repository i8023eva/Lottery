//
//  SaveTool.h
//  Lottery
//
//  Created by lyh on 15/11/11.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  保存设置信息
 */
@interface SaveTool : NSObject

+ (void)setObject:(id)value forKey:(NSString *)defaultName;

+ (id)objectForKey:(NSString *)defaultName;
@end
