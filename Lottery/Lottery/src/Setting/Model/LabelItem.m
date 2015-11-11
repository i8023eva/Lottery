//
//  LabelItem.m
//  Lottery
//
//  Created by lyh on 15/11/11.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "LabelItem.h"
#import "SaveTool.h"

@implementation LabelItem

- (void)setText:(NSString *)text
{
    _text = text;
    
    [SaveTool setObject:text forKey:self.title]; //当更改 label 的 text 时自动保存用户信息  根据 title
}

- (void)setTitle:(NSString *)title /////////// 在 push 时更改 title 时, 就会提取信息
{
    [super setTitle:title];
    
    _text = [SaveTool objectForKey:self.title];
}
@end
