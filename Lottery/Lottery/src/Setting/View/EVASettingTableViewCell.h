//
//  EVASettingTableViewCell.h
//  Lottery
//
//  Created by lyh on 15/11/9.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EVASettingItem;
@interface EVASettingTableViewCell : UITableViewCell

@property (nonatomic, strong) EVASettingItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
