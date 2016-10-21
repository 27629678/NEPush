//
//  NEPushNotificationDelegate.h
//  mail
//
//  Created by hzyuxiaohua on 2016/10/18.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NEPushNotificationDelegate <NSObject>

@required
- (void)pushServiceDidReceiveDeviceToken:(NSString *)token;

- (void)pushServiceRegisterNotificationWithError:(NSError *)error;

- (void)pushServiceHandleActionWithIdentifier:(NSString *)identifier userInfo:(NSDictionary *)userInfo complete:(void(^)())complete;

- (void)pushServiceDidReceiveNotification:(NSDictionary *)userInfo isRemote:(BOOL)isRemote complete:(void (^)(UIBackgroundFetchResult))complete;

@end
