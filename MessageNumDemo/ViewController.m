//
//  ViewController.m
//  MessageNumDemo
//
//  Created by 张小冬 on 16/1/25.
//  Copyright © 2016年 dadong. All rights reserved.
//

#import "ViewController.h"
#import "MessageNumView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.tabBarItem.badgeValue = @"8";
    MessageNumView *mv = [[MessageNumView alloc]initWithFrame:CGRectMake(100, 100, 30, 15)];
    mv.badgeValue = @"new";
    [self.view addSubview:mv];
    
    
    MessageNumView *mv2 = [[MessageNumView alloc]initWithFrame:CGRectMake(100, 200, 30, 15)];
    mv2.badgeValue = @"9";
    [self.view addSubview:mv2];
    
    
    MessageNumView *mv3 = [[MessageNumView alloc]initWithFrame:CGRectMake(200, 100, 30, 15)];
    mv3.badgeValue = @"99";
    [self.view addSubview:mv3];
    
    
    MessageNumView *mv4 = [[MessageNumView alloc]initWithFrame:CGRectMake(200, 200, 30, 15)];
    mv4.badgeValue = @"999";
    [self.view addSubview:mv4];
    
    MessageNumView *mv5 = [[MessageNumView alloc]initWithFrame:CGRectMake(150, 150, 30, 15)];
    mv5.badgeValue = @"more";
    [self.view addSubview:mv5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
