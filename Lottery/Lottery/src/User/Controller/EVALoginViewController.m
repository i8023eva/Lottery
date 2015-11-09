//
//  EVALoginViewController.m
//  Lottery
//
//  Created by lyh on 15/11/9.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "EVALoginViewController.h"
#import "EVASettingViewController.h"

@interface EVALoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation EVALoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *image = [UIImage imageNamed:@"RedButton"];
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    [self.loginButton setBackgroundImage:image forState:UIControlStateNormal];
    
    UIImage *imageH = [UIImage imageNamed:@"RedButtonPressed"];
    imageH = [imageH stretchableImageWithLeftCapWidth:imageH.size.width * 0.5 topCapHeight:imageH.size.height * 0.5];
    [self.loginButton setBackgroundImage:imageH forState:UIControlStateHighlighted];
    
}

- (IBAction)setting:(UIBarButtonItem *)sender {
    EVASettingViewController *setVC = [[EVASettingViewController alloc]init];
    
    [self.navigationController pushViewController:setVC animated:YES];
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
