//
//  SubscriptionServiceCenter.m
//  ObserverPatternOC
//
//  Created by 张青明 on 15/11/8.
//  Copyright (c) 2015年 极客栈. All rights reserved.
//

#import "SubscriptionServiceCenter.h"
static NSMutableDictionary *subscriptionDictionary;
static SubscriptionServiceCenter *sharedInstance;

@interface SubscriptionServiceCenter()
{
    
}

@end

@implementation SubscriptionServiceCenter

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SubscriptionServiceCenter alloc]init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%s", __func__);
        subscriptionDictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}


- (void)createSubscriptionNumber:(NSString *)subscriptionNumber
{
    NSLog(@"%s", __func__);
    NSParameterAssert(subscriptionNumber);
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    if (hashTable == nil) {
        hashTable = [NSHashTable weakObjectsHashTable];
        [subscriptionDictionary setObject:hashTable forKey:subscriptionNumber];
    }
    else
    {
        NSLog(@"no nil %s",__func__);
    }
}
- (void)removeSubscriptionNumber:(NSString *)subscriptionNumber
{
//    NSLog(@"%s", __func__);
    NSParameterAssert(subscriptionNumber);
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    if (hashTable != nil) {
        [subscriptionDictionary removeObjectForKey:subscriptionNumber];
    }
    else
    {
        NSLog(@"nil %s",__func__);
    }
}

- (void)addCustomer:(id<SubscriptionServiceCenterProtocol>)customer withSubscriptionNumber:(NSString *)subscriptionNumber
{
    NSLog(@"%s", __func__);
    NSParameterAssert(customer);
    NSParameterAssert(subscriptionNumber);
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    if (hashTable != nil) {
        [hashTable addObject:customer];
    }
    else
    {
        NSLog(@"nil %s",__func__);
        [hashTable addObject:customer];
    }
}

- (void)removeCustomer:(id<SubscriptionServiceCenterProtocol>)customer withSubscriptionNumber:(NSString *)subscriptionNumber
{
//    NSLog(@"%s", __func__);
    NSParameterAssert(customer);
    NSParameterAssert(subscriptionNumber);
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    if (hashTable != nil) {
        [hashTable removeObject:customer];
    }
    else
    {
        NSLog(@"nil %s",__func__);
        [hashTable removeObject:customer];
    }
}

- (void)sendMessage:(id)message toSubscriptionNumber:(NSString *)subscriptionNumber
{
    NSLog(@"%s", __func__);
    NSParameterAssert(subscriptionNumber);
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    if (hashTable != nil) {
        NSEnumerator *enumerator = [hashTable objectEnumerator];
        id<SubscriptionServiceCenterProtocol> object = nil;
        while (object = [enumerator nextObject]) {
            NSLog(@"object:%@", object);
            if ([object respondsToSelector:@selector(subscriptionMessage:subscriptionNumber:) ]) {
                [object subscriptionMessage:message subscriptionNumber:subscriptionNumber];
            }
        }
    }else
    {
        NSLog(@"nil %s", __func__);
    }
}

#pragma mark - 私有方法
- (NSHashTable *)existSubscriptionNumber:(NSString *)subscriptionNumber
{
    NSLog(@"%s", __func__);
    return [subscriptionDictionary objectForKey:subscriptionNumber];
}


@end
