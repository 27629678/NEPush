//
//  IOSVersion.h
//  mail
//
//  Created by oldman on 14-4-1.
//  Copyright (c) 2014年 NetEase (Hangzhou) Network Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IOSVersion : NSObject

// 当前系统版本号与otherVersion做比较
+ (NSComparisonResult)compare:(NSString *)otherVersion;

+ (BOOL)isLowerThanIOS7;

+ (BOOL)isLowerThanIOS8;

+ (BOOL)isLowerThanIOS9;

+ (BOOL)isLowerThanIOS10;

+ (BOOL)isNoLessThanIOS10;

+ (NSString *)version;

+ (NSString*)buildVersion;

+ (void)runFor7_1Lower:(void(^)())lowerBlock for8_0Later:(void(^)())laterBlock;

+ (void)runFor8_1Lower:(void (^)())lowerBlock for8_1Later:(void (^)())laterBlock;

@end
