//
//  SubscriptionServiceCenter.h
//  ObserverPatternOC
//
//  Created by 张青明 on 15/11/8.
//  Copyright (c) 2015年 极客栈. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubscriptionServiceCenterProtocol.h"

@interface SubscriptionServiceCenter : NSObject
#pragma mark - 单例
+ (instancetype)sharedInstance;

#pragma mark - 维护客户信息
/**
 *  创建订阅号
 *
 *  @param subscriptionNumber 订阅号码
 */
- (void)createSubscriptionNumber:(NSString *)subscriptionNumber;
/**
 *  移除订阅号
 *
 *  @param subscriptionNumber 订阅号码
 */
- (void)removeSubscriptionNumber:(NSString *)subscriptionNumber;
/**
 *  添加客户到具体的订阅号中
 *
 *  @param customer           客户
 *  @param subscriptionNumber 订阅号码
 */
- (void)addCustomer:(id<SubscriptionServiceCenterProtocol>)customer withSubscriptionNumber:(NSString *)subscriptionNumber;
/**
 *  从具体的订阅号中移除客户
 *
 *  @param customer           客户
 *  @param subscriptionNumber 订阅号码
 */
- (void)removeCustomer:(id<SubscriptionServiceCenterProtocol>)customer withSubscriptionNumber:(NSString *)subscriptionNumber;

#pragma mark - 发送信息
/**
 *  发送消息到具体的订阅号当中
 *
 *  @param message            消息
 *  @param subscriptionNumber 订阅号码
 */
- (void)sendMessage:(id)message toSubscriptionNumber:(NSString *)subscriptionNumber;



@end
