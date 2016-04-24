//
//  ViewController.m
//  LostOfViews
//
//  Created by miyoo on 16/1/23.
//  Copyright (c) 2016年 miyoo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate, UIActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
   
//    [self switer];           // 开关控件
    
//    [self slider];           // 进度
    
//    [self webView];          // 网页视图
    
    [self indicator];        // 活动指示器
    
    [self statusIndicator];  // 状态栏活动指示器
    
}


// ====================   1. 开关控件   ==================
//  开关控件
- (void)switer {
    // 1. 实例化一个开关
    UISwitch *switer = [[UISwitch alloc] init];
    // 2. 修改一个开关的大小是无意义的。
    switer.frame = CGRectMake(100, 100, 0, 0);
    // 3. 设背景色
//    switer.backgroundColor = [UIColor redColor];
    //
    [self.view addSubview:switer];
    
    // 4. 颜色属性
    /*
     @property(nonatomic, retain) UIColor *onTintColor ;
     @property(nonatomic, retain) UIColor *tintColor ;
     @property(nonatomic, retain) UIColor *thumbTintColor ;
     
     @property(nonatomic, retain) UIImage *onImage ;
     @property(nonatomic, retain) UIImage *offImage;
     
     @property(nonatomic,getter=isOn) BOOL on;               // 
     */
    switer.onTintColor = [UIColor yellowColor];              // 开的时候颜色
    switer.tintColor = [UIColor greenColor];                 //
    switer.thumbTintColor = [UIColor grayColor];             // 按钮颜色
    
    // set，设置开关为打开状态
    switer.on = YES;                  // 打开状态
    
    // 获取一个开关的打开或者关闭状态  用isOn ！！！！！！！
    BOOL on = switer.isOn;            // 获取一个开关的 状态
    
    [switer setOn:YES animated:YES];
    
    // > 给switcher注册事件
    // > addTarget 是 UIControl 的方法，继承它的都能用
    // > 触发事件是 ValueChanged  ！！！！
    [switer addTarget:self action:@selector(swichAction:) forControlEvents:UIControlEventValueChanged];
}
//  开关的事件
- (void)swichAction:(UISwitch *)switcher{
    
    NSString *message = switcher.isOn ? @"打开了" : @"关闭了";
    NSLog(@"%@", message);
}




// ===================    2. 进度/滑块    =====================
// 》 作用 ：显示并调整进度
- (void)slider {
    // 1. 宽高是有有意的
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    slider .backgroundColor = [UIColor greenColor];
    [self.view addSubview:slider];
    
    // 2. 设置 slider 从左到右的值的范围 (默认范围 0 - 1)
    slider.minimumValue = 0;
    slider.maximumValue = 111;   // 自动平均分配进度
    
    // 3. 给slider注册事件
    // > 触发事件也是 ValueChanged  ！！！！
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    
    // 4. 设置当前进度
    slider.value = 50;
    
    // 5. slider 的各种属性、颜色
    /*
     @property(nonatomic,retain) UIImage *minimumValueImage;   // 滑块左边的进度图片
     @property(nonatomic,retain) UIImage *maximumValueImage;   //  右
     
     @property(nonatomic,retain) UIColor *minimumTrackTintColor;  // 最小部分的轨道 颜色
     @property(nonatomic,retain) UIColor *maximumTrackTintColor;  // 最大部分的轨道
     @property(nonatomic,retain) UIColor *thumbTintColor;         //   滑块
     */
    slider.minimumTrackTintColor = [UIColor yellowColor];
    slider.maximumTrackTintColor = [UIColor blueColor];
}


//事件    怎样获取 slider 值
- (void)sliderAction:(UISlider *)slider{
    // 值为float 类型
    // %g 打印float类型的参数 与%f 相比，舍去了尾部的0
    NSLog(@"%g", slider.value);
}




// ==================     3. 网页视图      ===================
- (void)webView {
    // 实例化
    UIWebView *web = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 背景色
    web.backgroundColor = [UIColor redColor];
    // 添加
    [self.view addSubview:web];
    
    // webView是用来显示一个网页的
    // http://10.0.8.8
    NSString *url = @"http://10.0.8.8";
    // 把这个地址转成NSURL
    NSURL *URL = [NSURL URLWithString:url];
    // 暂时不需要理解
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    //展示到 网页视图上
    [web loadRequest:request];
}




// =================    4.1 弹窗视图 ****  ===================
//  > iOS 8 之后就被4.3替代了
- (void)alertView {
    
    // 显示样式 ：没法控制  一左一右 cancel在左 ，好几排的 在cancel最下
    UIAlertView * alert =
    [[UIAlertView alloc] initWithTitle:@"提示"
                               message:@"信息"
                              delegate:self
                     cancelButtonTitle:@"cancel"
                     otherButtonTitles:@"1", @"2", @"3", nil];
    [alert show];
    
    // 》 可以通过协议方法来实现判断点击了哪一个 button
    // 》 遵循 <UIAlertViewDelegate> 代理
    // 》 代理为 delegate:self
}

// 点击事件
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    // 》 buttonIndex表示当前点击的按钮的下标
    // 》 其中，下标（ButtonAtIndex）是自己生成的
    // 》 %zd 是 NSUInteger 的输出标志符
    NSLog(@"%zd", buttonIndex);
}




// ==================     4.2 操作表    ========================

//destructive 红色的
- (void)actionSheet {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"标题"
                            
                                                       delegate:self
                                              cancelButtonTitle:@"取消"
                                         destructiveButtonTitle:@"不取消"
                                              otherButtonTitles:@"干嘛", @"狗带", @"不狗带", nil];
    [sheet showInView:sheet];
}

// 通过 协议代理遵循<UIAlertViewDelegate>
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    // %zd 接收 NSUInteger  按照图标从上到下的顺序
    
    NSLog(@"%zd", buttonIndex);
}




//  =============   4.3 UIAlertController  *****   ==============
//  UIAlertController 的父类是 UIViewController
//  alertController 是 AlertView 和 ActionSheet 的一个整合

// 其中 UIAlertControllerStyleActionSheet 不能设置输入框
- (void)alertController {
//    preferredStyle :
//    有两个选项 一个是：AlertView ，一个是：ActionSheet
    
    UIAlertController *alertC =
    [UIAlertController alertControllerWithTitle:@"提示"
                                        message:@"肚子已经饿啦"
                                 preferredStyle:UIAlertControllerStyleActionSheet];
    // 这也是界面跳转 ，不能放在viewDidLoad 不允许一个界面还没出来，就进行跳转到另一个界面里
    // 显示出来
    [self presentViewController:alertC animated:YES completion:nil];
    
    // alertController只提供一个显示的文案，具体的操作需要我们自己添加。
//    1. 标题 按钮需要显示的标题
//    2. 按钮的样式
    /*
     UIAlertActionStyleDefault = 0,   // 不参加
     UIAlertActionStyleCancel,        // 取消
     UIAlertActionStyleDestructive    // adj. 破坏的；毁灭性的；有害的，消极的
     */
//    3. 写点击的事件
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"狗带去" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        // 写点击的事件
        NSLog(@"点击了");
        // 获取两个输入框的内容 数组 从上到下按顺序来的
        UITextField *t0 = alertC.textFields.firstObject ;
        UITextField *t1 = alertC.textFields.lastObject;
        NSLog(@"%@   %@", t0.text , t1.text);
    }];
    //
    [alertC addAction:cancel];
    
//    // 在弹窗上添加一个输入框
//    [alertC addTextFieldWithConfigurationHandler:^(UITextField *textField) {
//        // 这个block里面可以对输入框进行设置 即自定义输入框样式
//        textField.textColor = [UIColor blueColor];
//    }];
//    
//    // 在弹窗上添加一个输入框
//    [alertC addTextFieldWithConfigurationHandler:^(UITextField *textField) {
//        // 这个block里面可以对输入框进行设置 即自定义输入框样式
//        textField.textColor = [UIColor blueColor];
//    }];
    
    
//    拿到弹窗的对象
    
}


//  点击空白处时
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self alertView];          //  弹窗视图
//    [self actionSheet];        //  操作表
    [self alertController];      //  UIAlertController
}




//  =====================   5. 活动指示器    ======================
// 界面上的小菊花
- (void)indicator{
    
    /*
     UIActivityIndicatorViewStyleWhiteLarge,  // 大白
     UIActivityIndicatorViewStyleWhite,       // 小白
     UIActivityIndicatorViewStyleGray,        // 小灰
     */
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator.frame = CGRectMake(100, 100, 100, 100);
    indicator.backgroundColor = [UIColor blueColor];
    [self.view addSubview:indicator];
    
    // 活动指示器，处于活动状态，才可见，不活动的时候，默认是隐藏的
    [indicator startAnimating];  //  开始活动状态
//    [indicator stopAnimating];   //  结束活动状态
}




//  ===================    6. 状态栏指示器    ======================
// 在状态栏上的小菊花
- (void)statusIndicator{
    
    //不用实例化 系统已经做好了 拿到单例
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;   //  代表拿到当前。。。的单例
}




@end
