//
//  ScoreNoticeViewController.m
//  Lottery
//
//  Created by lyh on 15/11/11.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "ScoreNoticeViewController.h"
#import "EVASettingItem.h"
#import "SwitchItem.h"
#import "EVAGroup.h"
#import "LabelItem.h"

@interface ScoreNoticeViewController ()

@property (nonatomic, strong) LabelItem *start;
@end

@implementation ScoreNoticeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 0组
    [self addGroup0];
    // 1组
    [self addGroup1];
    // 2组
    [self addGroup2];
    
}

- (void)addGroup0
{
    SwitchItem *notice = [SwitchItem itemWithIcon:nil title:@"提醒我关注比赛"];
    
    EVAGroup *group = [[EVAGroup alloc] init];
    group.items = @[notice];
    group.footer = @"asdsad";
    [self.sourceArray addObject:group];
}

- (void)addGroup1
{
    LabelItem *start = [LabelItem itemWithIcon:nil title:@"开始时间"];
    _start = start;
    
    if (!start.text.length) {
        start.text = @"00:00";
    }
#warning 键盘事件
    start.block = ^{
        UITextField *textField = [[UITextField alloc] init];
        
        UIDatePicker *datePicker = [[UIDatePicker alloc] init];
        // 设置模式
        datePicker.datePickerMode = UIDatePickerModeTime;
        
        // 设置地区
        datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
        
        // 创建日期格式对象
        NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
        dateF.dateFormat = @"HH:mm";
        // 设置日期
        datePicker.date = [dateF dateFromString:@"00:00"];
        
        // 监听UIDatePicker
        [datePicker addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
        
        // 设置键盘
        textField.inputView = datePicker;
        
        [textField becomeFirstResponder];
        [self.view addSubview:textField];
    };
    EVAGroup *group = [[EVAGroup alloc] init];
    group.items = @[start];
    group.header = @"213214234324";
    [self.sourceArray addObject:group];
}

- (void)valueChange:(UIDatePicker *)datePicker
{
    // 创建日期格式对象
    NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
    dateF.dateFormat = @"HH:mm";
    _start.text = [dateF stringFromDate:datePicker.date]; //////////save
    
    [self.tableView reloadData];
}

- (void)addGroup2
{
    LabelItem *stop = [LabelItem itemWithIcon:nil title:@"结束时间"];
    stop.text = @"00:00";
    EVAGroup *group = [[EVAGroup alloc] init];
    group.items = @[stop];
    
    [self.sourceArray addObject:group];
}

@end
