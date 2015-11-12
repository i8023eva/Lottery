//
//  AboutViewController.m
//  Lottery
//
//  Created by lyh on 15/11/11.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "AboutViewController.h"
#import "EVAGroup.h"
#import "EVASettingItem.h"
#import "ArrowItem.h"
#import "AboutHeaderView.h"

@interface AboutViewController ()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation AboutViewController

-(UIWebView *)webView {
    if (_webView == nil) {
        _webView = [[UIWebView alloc]initWithFrame:CGRectZero];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 0组
    [self addGroup0];
    
    self.tableView.tableHeaderView = [AboutHeaderView headerView];
}

- (void)addGroup0
{
    // 0组
    ArrowItem *score = [ArrowItem itemWithIcon:nil title:@"评分支持" destVcClass:nil];
    /**
     *  appStore 评分
     */
    score.block = ^{
        NSString *appID = @"";
        NSString *str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/id%@?mt=8", appID];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    };

    EVASettingItem *tel = [ArrowItem itemWithIcon:nil title:@"客服电话"];
    tel.subTitle = @"020-83568090";
    /**
     *  打电话
     */
    tel.block = ^{
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"tel://10010"]]];
    };
    
    EVAGroup *group0 = [[EVAGroup alloc] init];
    group0.items = @[score,tel];
    
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
