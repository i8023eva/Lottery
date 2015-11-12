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

#import <MessageUI/MessageUI.h>
#import "UMSocial.h"

@interface ShareViewController ()<MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate, UMSocialUIDelegate>

@property (nonatomic, assign) int age;
@end

@implementation ShareViewController

-(void)dealloc {
    NSLog(@"dealloc");
}

- (void)addGroup0
{
    // 0组
    ArrowItem *sina = [ArrowItem itemWithIcon:@"WeiboSina" title:@"新浪分享" ];
    
    __weak ShareViewController *share = self;
    sina.block = ^{
        [UMSocialSnsService presentSnsIconSheetView:self
                                             appKey:nil
                                          shareText:@"你要分享的文字"
                                         shareImage:[UIImage imageNamed:@"icon.png"]
                                    shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina, UMShareToTencent, UMShareToWechatSession, UMShareToWechatTimeline, UMShareToQzone, UMShareToQQ, UMShareToRenren, UMShareToDouban, UMShareToEmail, UMShareToSms, UMShareToFacebook, UMShareToTwitter,nil]
                                           delegate:self];
        [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToQQ, UMShareToQzone, UMShareToWechatSession, UMShareToWechatTimeline]];
    };
    
    EVASettingItem *sms = [ArrowItem itemWithIcon:@"SmsShare" title:@"短信分享"];
#pragma mark 发短信
#warning block holy shit
    /**
     *  block 会强引用其中的对象
     */
    
    sms.block = ^{
        MFMessageComposeViewController *vc = [[MFMessageComposeViewController alloc] init];
        // 设置短信内容
        vc.body = @"吃饭了没？";
        // 设置收件人列表
        vc.recipients = @[@"10010", @"02010010"];
        // 设置代理
        vc.messageComposeDelegate = share;
        
//        _age;
        /**
         *  _age  --->    self->_age;
         */
//        share.age;
        
        // 显示控制器
        [share presentViewController:vc animated:YES completion:nil];
    };
    
    EVASettingItem *mail = [ArrowItem itemWithIcon:@"MailShare" title:@"邮件分享"];
    
    mail.block = ^{
        // 不能发邮件
        if (![MFMailComposeViewController canSendMail]) return;
        
        MFMailComposeViewController *vc = [[MFMailComposeViewController alloc] init];
        
        // 设置邮件主题
        [vc setSubject:@"会议"];
        // 设置邮件内容
        [vc setMessageBody:@"今天下午开会吧" isHTML:NO];
        // 设置收件人列表
        [vc setToRecipients:@[@"643055866@qq.com"]];
        // 设置抄送人列表
        [vc setCcRecipients:@[@"1234@qq.com"]];
        // 设置密送人列表
        [vc setBccRecipients:@[@"56789@qq.com"]];
        
        
        // 添加附件（一张图片）
//        UIImage *image = [UIImage imageNamed:@"阿狸头像"];
//        NSData *data = UIImagePNGRepresentation(image);
//        [vc addAttachmentData:data mimeType:@"image/png" fileName:@"阿狸头像.png"];
        // 设置代理
        vc.mailComposeDelegate = share;
        // 显示控制器
        [share presentViewController:vc animated:YES completion:nil];
    };
    
    
    EVAGroup *group0 = [[EVAGroup alloc] init];
    
    group0.items = @[sina,sms,mail];
    
    [self.sourceArray addObject:group0];
}
#pragma mark - MFMessageComposeViewControllerDelegate
/**
 *  iOS7存在 bug, 应用的导航栏与系统自带的导航栏冲突, 联系人黑框
 *
 *  @param controller 必须用系统自带的导航条
 *  @param result     取消短信的时候就会调用此方法
 */
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    // 关闭短信界面
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    if (result == MessageComposeResultCancelled) {
        NSLog(@"取消发送");
    } else if (result == MessageComposeResultSent) {
        NSLog(@"已经发出");
    } else {
        NSLog(@"发送失败");
    }
}
#pragma mark - MFMailComposeViewControllerDelegate
/**
 *  邮件发送后的代理方法回调，发完后会自动回到原应用
 *
 *  @param controller
 *  @param result
 *  @param error      
 */
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    // 关闭邮件界面
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    if (result == MFMailComposeResultCancelled) {
        NSLog(@"取消发送");
    } else if (result == MFMailComposeResultSent) {
        NSLog(@"已经发出");
    } else {
        NSLog(@"发送失败");
    }
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
