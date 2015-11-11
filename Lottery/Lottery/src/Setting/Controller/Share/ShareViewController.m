//
//  ShareViewController.m
//  Lottery
//
//  Created by lyh on 15/11/11.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "ShareViewController.h"
#import "ArrowItem.h"
#import "EVASettingItem.h"
#import "EVAGroup.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

- (void)addGroup0
{
    // 0组
    ArrowItem *sina = [ArrowItem itemWithIcon:@"WeiboSina" title:@"新浪分享" ];
    
    EVASettingItem *sms = [ArrowItem itemWithIcon:@"SmsShare" title:@"短信分享"];
    
    EVASettingItem *mail = [ArrowItem itemWithIcon:@"MailShare" title:@"邮件分享"];
    
    
    EVAGroup *group0 = [[EVAGroup alloc] init];
    
    group0.items = @[sina,sms,mail];
    
    [self.sourceArray addObject:group0];
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self addGroup0];
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
