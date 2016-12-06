//
//  NEPushActionCategory.h
//  mail
//
//  Created by hzyuxiaohua on 2016/10/19.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class UNNotificationCategory, UNNotificationAction;

@interface NEPushActionCategory : NSObject

@property (nonatomic, copy) NSString* identifier;

- (UNNotificationCategory *)unCategoryWithActions:(NSArray<UNNotificationAction *> *)actions;

- (UIUserNotificationCategory *)uiCategoryWithActions:(NSArray<UIUserNotificationAction *> *)actions;

@end
