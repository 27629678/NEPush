//
//  NEPushAuthForIOS10_X.h
//  mail
//
//  Created by hzyuxiaohua on 2016/10/18.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NEPushAuthProtocol.h"

#import <UserNotifications/UserNotifications.h>

@interface NEPushAuthForIOS10_X : NSObject <NEPushAuthProtocol>

- (instancetype)initWithTarget:(id<UNUserNotificationCenterDelegate>)target;

@end
