//
//  ViewController.m
//  WebViewLoadHTML
//
//  Created by HanYong on 2018/4/25.
//  Copyright © 2018年 HanYong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.webView= [[UIWebView alloc] initWithFrame:self.view.frame];
    self.webView.delegate =self;
    [self.view addSubview:self.webView];
    
    [self loadHTML];
}

-(void)loadHTML{
    
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
    NSString *htmlContent = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    
    [self.webView loadHTMLString:htmlContent baseURL:baseURL];
}

#pragma mark -- UIWebViewDelegate
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSURL *url = [request URL];
    NSString *urlString = [NSString stringWithFormat:@"%@",url];
    
    //禁止部分跳转页面
//    if ([urlString isEqualToString:@"http://baidu.com/"]) {
//        return NO;
//    }
    NSLog(@"url = >%@",url);
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
