//
//  NEPushManager.m
//  mail
//
//  Created by hzyuxiaohua on 2016/10/17.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import "NEPushManager.h"

#import "AppDelegate.h"
#import "NEPushAuthManager.h"

@implementation NEPushManager

+ (BOOL)registerNotificationWithJson:(NSString *)json handler:(id<NEPushNotificationDelegate>)handler
{
    if (!handler || ![handler conformsToProtocol:NSProtocolFromString(@"NEPushNotificationDelegate")]) {
        NSDictionary* userInfo = @{ @"handler" : (handler ? NSStringFromClass([handler class]) : @"no pointee value") };
        NSString* reason = @"param of hanlder MUST NOT be nil or does not CONFIRMs To Protocol NEPushNotificationDelegate";
        @throw [NSException exceptionWithName:@"NEPushServiceException" reason:reason userInfo:userInfo];
    }
    
    return [NEPushAuthManager authWithJson:json handler:handler];
}

@end
