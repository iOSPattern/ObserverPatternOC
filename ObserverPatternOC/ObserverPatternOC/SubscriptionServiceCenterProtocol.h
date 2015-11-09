//
//  SubscriptionServiceCenterProtocol.h
//  ObserverPatternOC
//
//  Created by 张青明 on 15/11/9.
//  Copyright (c) 2015年 极客栈. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SubscriptionServiceCenterProtocol <NSObject>
- (void)subscriptionMessage:(id)message subscriptionNumber:(NSString *)subscriptionNumber;
@end
