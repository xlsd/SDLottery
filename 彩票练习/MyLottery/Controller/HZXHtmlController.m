//
//  HZXHtmlController.m
//  彩票练习
//
//  Created by 薛林 on 16/6/1.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXHtmlController.h"

@interface HZXHtmlController ()<UIWebViewDelegate>

@end

@implementation HZXHtmlController
//自定义视图
- (void)loadView {
    UIWebView *webView = [[UIWebView alloc]init];
    self.view = webView;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"NavBack"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    //加载本地hml文件
    //获取webView
    UIWebView *webView = (UIWebView *)self.view;
    //设置代理
    webView.delegate = self;
    //创建请求URL
    NSURL *url = [[NSBundle mainBundle]URLForResource:self.help.html withExtension:nil];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //webView加载请求对象
    [webView loadRequest:request];
}
//代理方法
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //需要执行的javaScript代码
    NSString *jsCode = [NSString stringWithFormat:@"window.location.href = '#%@'",self.help.ID];
    //webView执行js
    [webView stringByEvaluatingJavaScriptFromString:jsCode];
    
}


- (void)backClick {
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
