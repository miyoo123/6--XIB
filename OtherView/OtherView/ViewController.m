//
//  ViewController.m
//  OtherView
//
//  Created by qianfeng on 16/1/27.
//  Copyright (c) 2016年 qianfeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{

    NSTimer * timer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //进度条
    
    UIProgressView * progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(40, 30, 200, 30)];
    
    //高度没用
    
    //属性
    //默认0--1
    progressView.progress = 0.0;
    //颜色的定制
    progressView.tintColor = [UIColor redColor]; //完成的进度
    progressView.progressTintColor = [UIColor yellowColor];
    
    progressView.trackTintColor = [UIColor blackColor]; //未完成的
    
    [self.view addSubview:progressView];
    
    //对它进行封装   继承UIView
    
    progressView.tag = 11;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timerGo:) userInfo:nil repeats:YES];
    
    
    //userInfo  传参
    
    
    
    //步数器
    
    UIStepper * stepper = [[UIStepper alloc] initWithFrame:CGRectMake(40, 130, 200, 44)];
    
    [self.view addSubview:stepper];
    
    //属性
    
    //步数器的最大值
    stepper.maximumValue = 20;
    //最小值
    stepper.minimumValue = 10;
    //步数器的当前值
    stepper.value = 17;
    
    
    [stepper addTarget:self action:@selector(step:) forControlEvents:UIControlEventValueChanged];
    //只发生改变的时候调用此方法
    
    UILabel * laber = [[UILabel alloc] initWithFrame:CGRectMake(40, 300, 200, 44)];
    laber.tag = 12;
    laber.text = @" ----17";
    [self.view addSubview:laber];
    
    //步数器 属性
    //达到最大值之后  点+的作用
    stepper.wraps = YES;
    
    //设置是否自增长
     stepper.autorepeat = NO;
    //阶跃值
    stepper.stepValue = 2;
    //改变颜色
    stepper.tintColor = [UIColor orangeColor];
    //可以设置背景图片
    [stepper setBackgroundImage:[UIImage imageNamed:@"4.jpg"] forState:UIControlStateNormal];
    //可以设置分割线
    
  //  [stepper setDividerImage:[UIImage imageNamed:@"table-cell-bg-normal副本"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal];
    
    //多段选择器
    
    //多段选择器的items  是由字符串或者图片对象组成的数组
    UISegmentedControl * set = [[UISegmentedControl alloc] initWithItems:@[@"左边",[UIImage imageNamed:@"Icon副本"],@"右边"]];
    
    set.frame =CGRectMake(40, 350, 300, 40);
    
    //设置选中项的下标
    
    set.selectedSegmentIndex = 1;
    
    [self.view addSubview:set];
    
    //多段选择器的元素可以进行增删
    [set addTarget:self action:@selector(seg:) forControlEvents:UIControlEventValueChanged];
    
    //设置背景图片   设置分割线   设置颜色
    set.tintColor = [UIColor grayColor];
    
    //设置背景图片
   // [set setBackgroundImage:[UIImage imageNamed:@"4.jpg"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    //设置分割线
    
    [set setDividerImage:[UIImage imageNamed:@"table-cell-bg-normal副本"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    //文本视图
    
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(200, 130, 60, 80)];
    
    textView.backgroundColor = [UIColor redColor];
    
    //文本视图可以滚动：UIScrollView (继承)
    [self.view addSubview:textView];
    
  //  textView.delegate
 
    
    
}

-(void)seg:(UISegmentedControl *) set {


    if (set.numberOfSegments == 3 &&  set.selectedSegmentIndex == 0) {
        [set removeSegmentAtIndex:1 animated:YES];
    }
    
    if (set.numberOfSegments == 2 && set.selectedSegmentIndex == 1 ) {
        [set insertSegmentWithImage:[UIImage imageNamed:@"Icon副本"] atIndex:1 animated:YES];
    }

    //只能删后面的   不能删除前面的元素

    
    
    

}


-(void)step:(UIStepper *)stepper {

    UILabel * label = (id)[self.view viewWithTag:12];
    
    label.text = [NSString stringWithFormat:@"---%d",(int)stepper.value];

}

-(void)timerGo:(NSTimer *)timer {

    //获得上面穿的参数
   // NSString * abc = timer.userInfo;
    
    UIProgressView * pg =(id) [self.view viewWithTag:11];
    pg.progress += 0.1;
    
    [pg setProgress:(pg.progress += 0.1) animated:YES];
    if (pg.progress == 1) {
        
        //定时器zanting
        [timer setFireDate:[NSDate distantFuture]];
    }
}

-(void)dealloc {
    
    if (timer != nil) {
        [timer invalidate];
        
        
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
