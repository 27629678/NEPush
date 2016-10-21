//
//  NEPushAction.h
//  mail
//
//  Created by hzyuxiaohua on 2016/10/19.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UNNotificationAction;

@interface NEPushAction : NSObject

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* identifier;
@property (nonatomic, assign) NSUInteger options;

- (UNNotificationAction *)unAction;

- (UIUserNotificationAction *)uiAction;

@end
