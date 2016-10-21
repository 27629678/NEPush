//
//  NEPushAuthManager.m
//  mail
//
//  Created by hzyuxiaohua on 2016/10/18.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import "NEPushAuthManager.h"

#import "AppDelegate.h"
#import "IOSVersion.h"
#import "NEPushAuthForIOS7_X.h"
#import "NEPushAuthForIOS8_X.h"
#import "NEPushAuthForIOS10_X.h"
#import "NEPushNotificationHandler.h"

@implementation NEPushAuthManager

+ (BOOL)authWithJson:(NSString *)json handler:(id<NEPushNotificationDelegate>)handler
{
    NEPushNotificationHandler* target = [NEPushNotificationHandler defaultHandler];
    target.delegate = handler;
    
    if ([IOSVersion isLowerThanIOS8]) {
        return [[[NEPushAuthForIOS7_X alloc] init] authWithJson:json];
    }
    
    if ([IOSVersion isLowerThanIOS10]) {
        return [[[NEPushAuthForIOS8_X alloc] init] authWithJson:json];
    }
    
    return [[[NEPushAuthForIOS10_X alloc] initWithTarget:target] authWithJson:json];
}

@end
