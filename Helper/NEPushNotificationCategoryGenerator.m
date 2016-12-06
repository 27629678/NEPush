//
//  NEPushNotificationCategoryGenerator.m
//  mail
//
//  Created by hzyuxiaohua on 2016/10/19.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import "NEPushNotificationCategoryGenerator.h"

#import "NEPushConstants.h"

@implementation NEPushNotificationCategoryGenerator

+ (NSString *)json
{
    
//    NSArray* ac4mail = @[ @{ @"titile"       : @"标为已读",
//                             @"identifier"   : kNEPushMarkMailAsReadActionIdentifier,
//                             @"options"      : @(NEPushActionOptionBackground)
//                             },
//                          @{ @"titile"       : @"删除",
//                             @"identifier"   : kNEPushMarkMailAsDeletedActionIdentifier,
//                             @"options"      : @(NEPushActionOptionBackground |
//                                 NEPushActionOptionDestructive |
//                                 NEPushActionOptionAuthRequired)
//                             }];
//    NSArray* ac4todo = @[ @{ @"titile"       : @"标为已完成",
//                             @"identifier"   : kNEPushMarkToDoAsFinishedActionIdentifier,
//                             @"options"      : @(NEPushActionOptionBackground)
//                             }];
    
    NSDictionary* dict = @{ @"options"      : @(NEPushAuthOptionAlert |
                                                NEPushAuthOptionBadge |
                                                NEPushAuthOptionSound),
                            @"categories"   : @[
//                                                  @{  @"identifier"   : kNEPushMailCategoryPushIdentifier,
//                                                      @"actions"      : ac4mail
//                                                    },
//                                                  @{  @"identifier"   : kNEPushToDoCategoryIdentifier,
//                                                      @"actions"      : ac4todo
//                                                     }
                            ]
                           };
    NSError* error = nil;
    NSData* data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    if (error) {
        NSLog(@"<NEPushNotificationActegoryGenerator.raise error:%@>", error);
        return nil;
    }
    
    NSString* json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return json;
}

@end
