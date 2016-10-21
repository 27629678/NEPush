//
//  NEPushNotificationHandler.h
//  mail
//
//  Created by hzyuxiaohua on 2016/10/18.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NEPushNotificationDelegate.h"

#import <UserNotifications/UserNotifications.h>

@interface NEPushNotificationHandler : NSObject <UNUserNotificationCenterDelegate>

@property (nonatomic, weak) id<NEPushNotificationDelegate> delegate;

+ (instancetype)defaultHandler;

@end
