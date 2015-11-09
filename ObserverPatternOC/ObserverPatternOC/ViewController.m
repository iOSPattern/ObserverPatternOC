//
//  ViewController.m
//  ObserverPatternOC
//
//  Created by 张青明 on 15/11/8.
//  Copyright (c) 2015年 极客栈. All rights reserved.
//

#import "ViewController.h"
#import "SubscriptionServiceCenter.h"

static NSString *const SCIENCE = @"SCIENCE";

@interface ViewController ()<SubscriptionServiceCenterProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SubscriptionServiceCenter *center = [SubscriptionServiceCenter sharedInstance];

    // 创建订阅号
    [center createSubscriptionNumber:SCIENCE];
    // 添加订阅的用户到指定的刊物
    [center addCustomer:self withSubscriptionNumber:SCIENCE];
    // 发行机构发送消息
    [center sendMessage:@"V1.0" toSubscriptionNumber:SCIENCE];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SubscriptionServiceCenterProtocol
- (void)subscriptionMessage:(id)message subscriptionNumber:(NSString *)subscriptionNumber;
{
    NSLog(@"%@  %@", message, subscriptionNumber);
}

@end
