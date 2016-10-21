//
//  AppDelegate+NEPushService.m
//  mail
//
//  Created by hzyuxiaohua on 2016/10/18.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import "AppDelegate+NEPushService.h"

#import "NEPushNotificationHandler.h"

@implementation AppDelegate (NEPushService)

#pragma mark - auth

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    const unsigned char *dataBuffer = (const unsigned char *)[deviceToken bytes];
    if (!dataBuffer) {
        NSCAssert(NO, @"");
        return;
    }
    
    NSUInteger dataLength  = [deviceToken length];
    NSMutableString *hexString  = [NSMutableString stringWithCapacity:(dataLength * 2)];
    
    for (int i = 0; i < dataLength; ++i) {
        [hexString appendString:[NSString stringWithFormat:@"%02lx", (unsigned long)dataBuffer[i]]];
    }
    
    [[NEPushNotificationHandler defaultHandler].delegate pushServiceDidReceiveDeviceToken:hexString];
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    [[NEPushNotificationHandler defaultHandler].delegate pushServiceRegisterNotificationWithError:error];
}

#pragma mark - notifications

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    [[NEPushNotificationHandler defaultHandler].delegate
     pushServiceDidReceiveNotification:notification.userInfo isRemote:NO complete:^(UIBackgroundFetchResult result) {
         // do nothing
     }];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    [[NEPushNotificationHandler defaultHandler].delegate
     pushServiceDidReceiveNotification:userInfo isRemote:YES complete:^(UIBackgroundFetchResult result) {
         completionHandler(result);
     }];
}

#pragma mark - notification actions

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier
forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^)())completionHandler
{
    [[NEPushNotificationHandler defaultHandler].delegate
     pushServiceHandleActionWithIdentifier:identifier userInfo:notification.userInfo complete:completionHandler];
}

-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier
forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)())completionHandler
{
    [[NEPushNotificationHandler defaultHandler].delegate
     pushServiceHandleActionWithIdentifier:identifier userInfo:userInfo complete:completionHandler];
}

@end
