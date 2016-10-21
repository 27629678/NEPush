//
//  NEPushAuthManager.h
//  mail
//
//  Created by hzyuxiaohua on 2016/10/18.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NEPushNotificationDelegate.h"

@interface NEPushAuthManager : NSObject

+ (BOOL)authWithJson:(NSString *)json handler:(id<NEPushNotificationDelegate>)handler;

@end
