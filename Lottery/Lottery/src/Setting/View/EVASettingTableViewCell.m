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
#import "LabelItem.h"

@interface EVASettingTableViewCell ()
@property (nonatomic, strong) UISwitch *sw;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) SwitchItem *valueOn;//妈的,  并不是使用属性
@end

@implementation EVASettingTableViewCell

-(UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.bounds = CGRectMake(0, 0, 100, 44);
        _timeLabel.textColor = [UIColor colorWithRed:1.000 green:0.502 blue:0.000 alpha:1.000];
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
}

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
        [_sw addTarget:self action:@selector(valuechanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _sw;
}

-(void) valuechanged: (UISwitch *)sender { //不能随意点击
    SwitchItem *switchItem = (SwitchItem *)self.item;
    switchItem.off = !sender.isOn;
}

-(void)setItem:(EVASettingItem *)item {
    _item = item;
#warning 有些是没有图片的
    if (_item.icon.length) {
        self.imageView.image = [UIImage imageNamed:item.icon];
    }
    self.textLabel.text = item.title;
    
    if ([_item isMemberOfClass:[ArrowItem class]]) {
        self.accessoryView = self.imgView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else if ([_item isMemberOfClass:[SwitchItem class]]) {
        
        SwitchItem *switchItem = (SwitchItem *)_item;
        self.sw.on = !switchItem.off;
        self.accessoryView = self.sw;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if ([_item isKindOfClass:[LabelItem class]]){
        self.accessoryView = self.timeLabel;
#warning
        LabelItem *labelItem = (LabelItem *)_item;
        self.timeLabel.text = labelItem.text;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
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
