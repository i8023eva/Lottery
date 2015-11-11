//
//  AboutView.m
//  Lottery
//
//  Created by lyh on 15/11/11.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "AboutHeaderView.h"

@implementation AboutHeaderView

+ (instancetype)headerView
{
    return [[NSBundle mainBundle] loadNibNamed:@"AboutHeaderView" owner:nil options:nil].firstObject;
}

@end
