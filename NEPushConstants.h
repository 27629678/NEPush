//
//  NEPushConstants.h
//  mail
//
//  Created by hzyuxiaohua on 2016/10/18.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, NEPushAuthOption) {
    NEPushAuthOptionNone                = 0,
    NEPushAuthOptionAlert               = 1 << 0,
    NEPushAuthOptionBadge               = 1 << 1,
    NEPushAuthOptionSound               = 1 << 2,
    
    NEPushAuthOptionAll                 = NSUIntegerMax,
};

typedef NS_OPTIONS(NSUInteger, NEPushSyncOption) {
    NEPushSyncOptionToken               = 1 << 0,
    NEPushSyncOptionAccount             = 1 << 1,
    NEPushSyncOptionUnread              = 1 << 2,
    NEPushSyncOptionGlobalSettings      = 1 << 3,
    NEPushSyncOptionAccountSettings     = 1 << 4,
    
    NEPushSyncOptionAll                 = NSUIntegerMax,
};

typedef NS_OPTIONS(NSUInteger, NEPushActionOption) {
    NEPushActionOptionBackground        = 1 << 0,
    NEPushActionOptionForeground        = 1 << 1,
    NEPushActionOptionAuthRequired      = 1 << 2,
    NEPushActionOptionDestructive       = 1 << 3,
};

// domain
extern NSString* const kNEPushAuthDomain;

// notification action
// mail
extern NSString* const kNEPushMarkMailAsReadActionIdentifier;
extern NSString* const kNEPushMarkMailAsDeletedActionIdentifier;
extern NSString* const kNEPushMailCategoryPushIdentifier;

// doto
extern NSString* const kNEPushMarkToDoAsFinishedActionIdentifier;
extern NSString* const kNEPushToDoCategoryIdentifier;

@interface NEPushConstants : NSObject

@end
