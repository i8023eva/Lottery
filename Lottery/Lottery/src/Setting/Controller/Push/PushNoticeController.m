//
//  PushNoticeController.m
//  Lottery
//
//  Created by lyh on 15/11/11.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "PushNoticeController.h"
#import "EVAGroup.h"
#import "EVASettingItem.h"
#import "ArrowItem.h"
#import "ScoreNoticeViewController.h"

@interface PushNoticeController ()

@end

@implementation PushNoticeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 0组
    [self addGroup0];
}

- (void)addGroup0
{
    // 0组
    ArrowItem *push = [ArrowItem itemWithIcon:nil title:@"开奖号码推送" destVcClass:nil];
    
    EVASettingItem *anim = [ArrowItem itemWithIcon:nil title:@"中奖动画"];
    
    EVASettingItem *score = [ArrowItem itemWithIcon:nil title:@"比分直播" destVcClass:[ScoreNoticeViewController class]];
    EVASettingItem *timer = [ArrowItem itemWithIcon:nil title:@"购彩定时提醒"];
    
    EVAGroup *group0 = [[EVAGroup alloc] init];
    group0.items = @[push,anim,score,timer];
    
    [self.sourceArray addObject:group0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
