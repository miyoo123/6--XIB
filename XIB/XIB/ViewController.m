//
//  ViewController.m
//  XIB
//
//  Created by miyoo on 16/1/23.
//  Copyright (c) 2016年 miyoo. All rights reserved.
//

#import "ViewController.h"
#import "ZHViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    ZHViewController *zhZC = [[ZHViewController alloc]init];
    [self presentViewController:zhZC animated:YES completion:nil];
}



@end
