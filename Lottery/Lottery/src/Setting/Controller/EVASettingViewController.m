//
//  EVASettingViewController.m
//  Lottery
//
//  Created by lyh on 15/11/9.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "EVASettingViewController.h"
#import "EVASettingItem.h"
#import "EVAGroup.h"
#import "EVASettingTableViewCell.h"
#import "ArrowItem.h"
#import "SwitchItem.h"
#import "MBProgressHUD+MJ.h"
#import "ProductViewController.h"
#import "PushNoticeController.h"
#import "HelpViewController.h"

@interface EVASettingViewController ()

@end

@implementation EVASettingViewController


-(void) addGroup0 {
        // 0组
    EVASettingItem *pushNotice = [ArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒" destVcClass:[PushNoticeController class]];
    EVASettingItem *yaoyiyao = [SwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选"];

    EVASettingItem *sound = [SwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果"];
    
    EVAGroup *group0 = [[EVAGroup alloc] init];
    group0.items = @[pushNotice, yaoyiyao, sound];
    group0.header = @"asdas";
    group0.footer = @"asdasd";
    
    [self.sourceArray addObject:group0];
}

-(void) addGroup1 {
        // 1组
        EVASettingItem *newVersion = [ArrowItem itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
        // 保存了一段检查更新的功能
        newVersion.block = ^{
            // 1.显示蒙板
            [MBProgressHUD showMessage:@"正在检查更新..."];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 2.隐藏蒙板
                [MBProgressHUD hideHUD];
                
                // 3.提示用户
                UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"更新版本" message:@"版本信息" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    return;
                }];
                UIAlertAction *actionCancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    return;
                }];
                [alertCon addAction:actionOK];
                [alertCon addAction:actionCancle];
                
                [self presentViewController:alertCon animated:YES completion:nil];
            });
        };
        
    EVASettingItem *help = [ArrowItem itemWithIcon:@"MoreHelp" title:@"帮助" destVcClass:[HelpViewController class]];
        EVASettingItem *MoreShare = [ArrowItem itemWithIcon:@"MoreShare" title:@"分享"];
        EVASettingItem *MoreMessage = [ArrowItem itemWithIcon:@"MoreMessage" title:@"查看消息"];
        EVASettingItem *MoreNetease = [ArrowItem itemWithIcon:@"MoreNetease" title:@"产品推荐" destVcClass:[ProductViewController class]];
        EVASettingItem *MoreAbout = [ArrowItem itemWithIcon:@"MoreAbout" title:@"关于"];
        
        EVAGroup *group1 = [[EVAGroup alloc] init];
        group1.header = @"帮助";
        group1.items = @[newVersion,help,MoreShare,MoreMessage,MoreNetease,MoreAbout];
        
        [self.sourceArray addObject:group1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addGroup0];
    [self addGroup1];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

@end
