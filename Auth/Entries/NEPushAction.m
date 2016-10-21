//
//  NEPushAction.m
//  mail
//
//  Created by hzyuxiaohua on 2016/10/19.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import "NEPushAction.h"

#import "NEPushConstants.h"

#import <UserNotifications/UserNotifications.h>

@implementation NEPushAction

- (UNNotificationAction *)unAction
{
    if (self.identifier.length * self.title.length == 0) {
        NSCAssert(NO, @"");
        return nil;
    }
    
    UNNotificationActionOptions options = UNNotificationActionOptionNone;
    if (self.options & NEPushActionOptionForeground) {
        options |= UNNotificationActionOptionForeground;
    }
    
    if (self.options & NEPushActionOptionDestructive) {
        options |= UNNotificationActionOptionDestructive;
    }
    
    if (self.options & NEPushActionOptionAuthRequired) {
        options |= UNNotificationActionOptionAuthenticationRequired;
    }
    
    return [UNNotificationAction actionWithIdentifier:self.identifier
                                         title:NSLocalizedString(self.title, @"")
                                       options:options];
}

- (UIUserNotificationAction *)uiAction
{
    if (self.identifier.length * self.title.length == 0) {
        NSCAssert(NO, @"");
        return nil;
    }
    
    UIUserNotificationActivationMode mode = UIUserNotificationActivationModeBackground;
    if (self.options & NEPushActionOptionForeground) {
        mode = UIUserNotificationActivationModeForeground;
    }
    
    UIMutableUserNotificationAction *action = [[UIMutableUserNotificationAction alloc] init];
    action.identifier = self.identifier;
    action.title= NSLocalizedString(self.title, @"");
    action.activationMode = mode;
    action.destructive = self.options & NEPushActionOptionDestructive;
    
    return action;
}

@end
