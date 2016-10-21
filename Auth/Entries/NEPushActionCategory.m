//
//  NEPushActionCategory.m
//  mail
//
//  Created by hzyuxiaohua on 2016/10/19.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import "NEPushActionCategory.h"

#import <UserNotifications/UserNotifications.h>

@implementation NEPushActionCategory

- (UNNotificationCategory *)unCategoryWithActions:(NSArray<UNNotificationAction *> *)actions
{
    return [UNNotificationCategory categoryWithIdentifier:self.identifier
                                                  actions:actions
                                        intentIdentifiers:@[]
                                                  options:UNNotificationCategoryOptionNone];
}

- (UIUserNotificationCategory *)uiCategoryWithActions:(NSArray<UIUserNotificationAction *> *)actions
{
    UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc] init];
    category.identifier = self.identifier;
    [category setActions:actions forContext:UIUserNotificationActionContextDefault];
    
    if (actions.count > 1) {
        // TODO:(yuxiaohua)为啥reverse actions数组，通知下拉后按钮显示顺序就正常了？！
        NSArray* reverseActions = actions.reverseObjectEnumerator.allObjects;
        [category setActions:reverseActions forContext:UIUserNotificationActionContextMinimal];
    }
    
    return category;
}

@end
