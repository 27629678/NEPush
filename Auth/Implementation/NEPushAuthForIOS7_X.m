//
//  NEPushAuthForIOS7_X.m
//  mail
//
//  Created by hzyuxiaohua on 2016/10/18.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import "NEPushAuthForIOS7_X.h"

@implementation NEPushAuthForIOS7_X

- (BOOL)authWithJson:(NSString *)json
{
    NEPushAuthInfo* auth = [[NEPushAuthInfo alloc] initWithJson:json];
    UIRemoteNotificationType types = [self remoteNotificationTypesWithOption:auth.options];
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:types];
    
    return YES;
}

- (UIRemoteNotificationType)remoteNotificationTypesWithOption:(NEPushAuthOption)option
{
    UIRemoteNotificationType types = UIRemoteNotificationTypeNone;
    if (option & NEPushAuthOptionAlert) {
        types |= UIRemoteNotificationTypeAlert;
    }
    
    if (option & NEPushAuthOptionBadge) {
        types |= UIRemoteNotificationTypeBadge;
    }
    
    if (option & NEPushAuthOptionSound) {
        types |= UIRemoteNotificationTypeSound;
    }
    
    return types;
}

@end
