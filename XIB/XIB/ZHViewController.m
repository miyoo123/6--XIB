//
//  ZHViewController.m
//  XIB
//
//  Created by miyoo on 16/1/23.
//  Copyright (c) 2016年 miyoo. All rights reserved.
//

#import "ZHViewController.h"

@interface ZHViewController ()


@property (weak, nonatomic) IBOutlet UITextField *userName;

@property (weak, nonatomic) IBOutlet UITextField *passWord;

@property (weak, nonatomic) IBOutlet UILabel *userNameButton;





@end

@implementation ZHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)textFiled:(id)sender {
    
}

- (IBAction)buttonAction:(UIButton *)sender {
    
    NSLog(@"%@", self.userName.text);
}




@end
