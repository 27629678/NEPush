//
//  NEPushAuthForIOS8_X.m
//  mail
//
//  Created by hzyuxiaohua on 2016/10/18.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import "NEPushAuthForIOS8_X.h"

@implementation NEPushAuthForIOS8_X

- (BOOL)authWithJson:(NSString *)json
{
    NEPushAuthInfo* auth = [[NEPushAuthInfo alloc] initWithJson:json];
    UIUserNotificationSettings* settings =
    [UIUserNotificationSettings settingsForTypes:[self userNotificationTypesWithOption:auth.options]
                                      categories:auth.uiCategories];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    return YES;
}

#pragma mark - private

- (UIUserNotificationType)userNotificationTypesWithOption:(NEPushAuthOption)option
{
    UIUserNotificationType types = UIUserNotificationTypeNone;
    if (option & NEPushAuthOptionAlert) {
        types |= UIUserNotificationTypeAlert;
    }
    
    if (option & NEPushAuthOptionBadge) {
        types |= UIUserNotificationTypeBadge;
    }
    
    if (option & NEPushAuthOptionSound) {
        types |= UIUserNotificationTypeSound;
    }
    
    return types;
}

@end
