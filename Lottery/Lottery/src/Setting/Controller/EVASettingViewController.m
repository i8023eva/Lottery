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

@interface EVASettingViewController ()
@property (nonatomic, strong) NSMutableArray *sourceArray;
@end

@implementation EVASettingViewController

-(NSMutableArray *)sourceArray {
    if (_sourceArray == nil) {
        _sourceArray = [NSMutableArray array];
        
        // 0组
        EVASettingItem *pushNotice = [ArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒"];
        EVASettingItem *yaoyiyao = [SwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选"];
        EVASettingItem *sound = [SwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果"];
        
        EVAGroup *group0 = [[EVAGroup alloc] init];
        group0.items = @[pushNotice, yaoyiyao, sound];
        group0.header = @"asdas";
        group0.footer = @"asdasd";
        
        // 1组
        EVASettingItem *newVersion = [ArrowItem itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
        EVASettingItem *help = [ArrowItem itemWithIcon:@"MoreHelp" title:@"帮助"];
        EVASettingItem *MoreShare = [ArrowItem itemWithIcon:@"MoreShare" title:@"分享"];
        EVASettingItem *MoreMessage = [ArrowItem itemWithIcon:@"MoreMessage" title:@"查看消息"];
        EVASettingItem *MoreNetease = [ArrowItem itemWithIcon:@"MoreNetease" title:@"产品推荐"];
        EVASettingItem *MoreAbout = [ArrowItem itemWithIcon:@"MoreAbout" title:@"关于"];
        
        EVAGroup *group1 = [[EVAGroup alloc] init];
        group1.header = @"帮助";
        group1.items = @[newVersion,help,MoreShare,MoreMessage,MoreNetease,MoreAbout];
        
        [_sourceArray addObject:group0];
        [_sourceArray addObject:group1];
    }
    return _sourceArray;
}

-(instancetype)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sourceArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    EVAGroup *group = self.sourceArray[section];
    return group.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 创建cell
    EVASettingTableViewCell *cell = [EVASettingTableViewCell cellWithTableView:tableView];
    
    // 取出模型
    EVAGroup *group = self.sourceArray[indexPath.section];
    EVASettingItem *item = group.items[indexPath.row];
    
    
    // 传递模型
    cell.item = item;
    
    return cell;
}


@end
