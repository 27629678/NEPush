//
//  NEPushManager.h
//  mail
//
//  Created by hzyuxiaohua on 2016/10/17.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NEPushNotificationDelegate.h"

@interface NEPushManager : NSObject

+ (BOOL)registerNotificationWithJson:(NSString *)json handler:(id<NEPushNotificationDelegate>)handler;

@end
