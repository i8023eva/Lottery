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
        
        EVASettingItem *help = [ArrowItem itemWithIcon:@"MoreHelp" title:@"帮助"];
        EVASettingItem *MoreShare = [ArrowItem itemWithIcon:@"MoreShare" title:@"分享"];
        EVASettingItem *MoreMessage = [ArrowItem itemWithIcon:@"MoreMessage" title:@"查看消息"];
        EVASettingItem *MoreNetease = [ArrowItem itemWithIcon:@"MoreNetease" title:@"产品推荐" destVcClass:[ProductViewController class]];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 取出模型
    EVAGroup *group = self.sourceArray[indexPath.section];
    EVASettingItem *item = group.items[indexPath.row];
    
    // 执行操作
    if (item.block) {
        item.block();
        return;
    }
    
    if ([item isKindOfClass:[ArrowItem class]]) { // 需要跳转控制器
        ArrowItem *arrowItem = (ArrowItem *)item;
        
        // 创建跳转的控制器
        if (arrowItem.destVcClass) {
            
            UIViewController *vc = [[arrowItem.destVcClass alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        
    }
    
}


@end
