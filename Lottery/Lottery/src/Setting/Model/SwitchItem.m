//
//  SwitchItem.m
//  Lottery
//
//  Created by lyh on 15/11/10.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "SwitchItem.h"
#import "SaveTool.h"

@implementation SwitchItem

-(void)setOff:(BOOL)off {
    _off = off;
    
    [SaveTool setBool:_off forKey:self.title];
}

- (void)setTitle:(NSString *)title
{
    // 这里不能拿到_title赋值，只能调用父类的set方法赋值
    [super setTitle:title];
    
    _off = [SaveTool boolForKey:self.title];
    
}

@end
