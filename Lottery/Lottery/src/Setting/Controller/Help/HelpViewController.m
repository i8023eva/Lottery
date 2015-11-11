//
//  HelpViewController.m
//  Lottery
//
//  Created by lyh on 15/11/11.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "HelpViewController.h"
#import "EVAHelp.h"
#import "ArrowItem.h"
#import "EVAGroup.h"
#import "HtmlViewController.h"
#import "EVANavigationController.h"

@interface HelpViewController ()
@property (nonatomic, strong) NSMutableArray *helpArray;
@end

@implementation HelpViewController

-(NSMutableArray *)helpArray {
    if (_helpArray == nil) {
        _helpArray = [EVAHelp help];
    }
    return _helpArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addGroup0];
}

-(void) addGroup0 {
    // 0组
    NSMutableArray *items = [NSMutableArray array];
    
    [self.helpArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ArrowItem *item = [ArrowItem itemWithIcon:nil title:[obj valueForKeyPath:@"title"] destVcClass:nil];
        [items addObject:item];
    }];
    
    EVAGroup *group0 = [[EVAGroup alloc] init];
    group0.items = items;
    
    [self.sourceArray addObject:group0];
}

// 重写tableView的点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取出每一行对应的Html模型
    EVAHelp *help = self.helpArray[indexPath.row];
    
    HtmlViewController *htmlVc = [[HtmlViewController alloc] init];
    htmlVc.title = help.title;
    htmlVc.help = help;
    
    EVANavigationController *nav = [[EVANavigationController alloc] initWithRootViewController:htmlVc];
    
    [self presentViewController:nav animated:YES completion:nil];
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
