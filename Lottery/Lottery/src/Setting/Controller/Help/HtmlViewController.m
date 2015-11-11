//
//  HtmlViewController.m
//  Lottery
//
//  Created by lyh on 15/11/11.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "HtmlViewController.h"
#import "EVAHelp.h"

@interface HtmlViewController ()<UIWebViewDelegate>

@end

@implementation HtmlViewController

- (void)loadView
{
    self.view = [[UIWebView alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *cancle = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancle)];
    self.navigationItem.leftBarButtonItem = cancle;
    
    
    UIWebView *webView = (UIWebView *)self.view;
    
    // 加载资源包里面的Html
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.help.html withExtension:nil];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    webView.delegate = self;
    
    [webView loadRequest:request];
    
}

// 加载完网页调用
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *js = [NSString stringWithFormat:@"window.location.href = '#%@';",self.help.ID];
    [webView stringByEvaluatingJavaScriptFromString:js];
}

- (void)cancle
{
    // 回到上一个控制器
    [self dismissViewControllerAnimated:YES completion:nil];
    
}






@end
