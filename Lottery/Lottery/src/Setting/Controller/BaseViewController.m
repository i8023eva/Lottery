//
//  BaseViewController.m
//  Lottery
//
//  Created by lyh on 15/11/11.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "BaseViewController.h"
#import "EVASettingItem.h"
#import "EVAGroup.h"
#import "EVASettingTableViewCell.h"
#import "ArrowItem.h"
#import "SwitchItem.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

-(NSMutableArray *)sourceArray {
    if (_sourceArray == nil) {
        _sourceArray = [NSMutableArray array];
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    EVAGroup *group = self.sourceArray[section];
    return group.header;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    EVAGroup *group = self.sourceArray[section];
    return group.footer;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
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
            vc.title = arrowItem.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}


@end
