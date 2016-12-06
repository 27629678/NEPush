//
//  NEPushNotificationHandler.m
//  mail
//
//  Created by hzyuxiaohua on 2016/10/18.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NEPushNotificationHandler.h"

#import "NEPushConstants.h"

@implementation NEPushNotificationHandler

+ (instancetype)defaultHandler
{
    static NEPushNotificationHandler* handler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handler = [[NEPushNotificationHandler alloc] init];
    });
    
    return handler;
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler
{
    NSDictionary* userInfo = notification.request.content.userInfo;
    if ([self isPushNotification:notification]) {
        [self.delegate pushServiceDidReceiveNotification:userInfo isRemote:YES complete:^(UIBackgroundFetchResult result) {
            completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionSound);
        }];
    }
    else {
        [self.delegate pushServiceDidReceiveNotification:userInfo isRemote:NO complete:^(UIBackgroundFetchResult result) {
            completionHandler(UNNotificationPresentationOptionNone);
        }];
    }
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)())completionHandler
{
    NSDictionary* userInfo = response.notification.request.content.userInfo;
    
    if ([self isNotificationActionResponse:response]) {
        [self.delegate pushServiceHandleActionWithIdentifier:response.actionIdentifier userInfo:userInfo complete:completionHandler];
        
        return;
    }
    
    [self.delegate pushServiceDidReceiveNotification:userInfo
                                            isRemote:[self isPushNotification:response.notification]
                                            complete:
     ^(UIBackgroundFetchResult result) {
         completionHandler();
     }];
}

#pragma mark - private

- (BOOL)isPushNotification:(UNNotification *)notification
{
    return [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]];
}

- (BOOL)isNotificationActionResponse:(UNNotificationResponse *)response
{
    return ![response.actionIdentifier isEqualToString:UNNotificationDefaultActionIdentifier];
}

@end
