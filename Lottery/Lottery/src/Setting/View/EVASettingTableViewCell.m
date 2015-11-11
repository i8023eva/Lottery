//
//  EVASettingTableViewCell.m
//  Lottery
//
//  Created by lyh on 15/11/9.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "EVASettingTableViewCell.h"
#import "EVASettingItem.h"
#import "ArrowItem.h"
#import "SwitchItem.h"

@interface EVASettingTableViewCell ()
@property (nonatomic, strong) UISwitch *sw;
@property (nonatomic, strong) UIImageView *imgView;
@end

@implementation EVASettingTableViewCell

- (UIImageView *)imgView
{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _imgView;
}

-(UISwitch *)sw {
    if (_sw == nil) {
        _sw = [[UISwitch alloc]init];
    }
    return _sw;
}

-(void)setItem:(EVASettingItem *)item {
    _item = item;
    
    self.imageView.image = [UIImage imageNamed:item.icon];
    self.textLabel.text = item.title;
    
    if ([_item isMemberOfClass:[ArrowItem class]]) {
        self.accessoryView = self.imgView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else if ([_item isMemberOfClass:[SwitchItem class]]) {
        self.accessoryView = self.sw;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else {
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"cell";
    EVASettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
