//
//  NEPushAuthForIOS10_X.m
//  mail
//
//  Created by hzyuxiaohua on 2016/10/18.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import "NEPushAuthForIOS10_X.h"

#import "NEPushConstants.h"
//#import "NEPushServiceLogger.h"

#import "NSError+NEPushMessager.h"

#import <UIKit/UIKit.h>

@interface NEPushAuthForIOS10_X ()

@property (nonatomic, weak) id<UNUserNotificationCenterDelegate> target;

@end

@implementation NEPushAuthForIOS10_X

- (instancetype)initWithTarget:(id<UNUserNotificationCenterDelegate>)target
{
    if (self = [super init]) {
        self.target = target;
    }
    
    return self;
}

- (BOOL)authWithJson:(NSString *)json
{
    NEPushAuthInfo* auth = [[NEPushAuthInfo alloc] initWithJson:json];
    UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
    NSUInteger options = [self userAuthOptionWithOption:auth.options];
    [center requestAuthorizationWithOptions:options completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error.authErrorMessage);
//            [NEPushServiceLogger logEvent:kNEPushServiceLogEventRegister message:error.authErrorMessage];
        }
    }];
    
    [center setNotificationCategories:auth.unCategories];
    center.delegate = self.target;
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    return YES;
}

#pragma mark - private

- (UNAuthorizationOptions)userAuthOptionWithOption:(NEPushAuthOption)option
{
    UNAuthorizationOptions options = 0;
    if (option & NEPushAuthOptionAlert) {
        options |= UNAuthorizationOptionAlert;
    }
    
    if (option & NEPushAuthOptionBadge) {
        options |= UNAuthorizationOptionBadge;
    }
    
    if (option & NEPushAuthOptionSound) {
        options |= UNAuthorizationOptionSound;
    }
    
    return options;
}

@end
