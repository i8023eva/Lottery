//
//  BaseViewController.h
//  Lottery
//
//  Created by lyh on 15/11/11.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  抽取父类
 */
@interface BaseViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *sourceArray;
@end
