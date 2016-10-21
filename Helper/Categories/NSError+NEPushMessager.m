//
//  NSError+NEPushMessager.m
//  mail
//
//  Created by hzyuxiaohua on 2016/10/18.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import "NSError+NEPushMessager.h"

#import "NEPushConstants.h"

#import "NSString+NEPushMessager.h"

@implementation NSError (NEPushMessager)

- (NSString *)authErrorMessage
{
    return [self pushErrorMessageWithDomain:kNEPushAuthDomain];
}

- (NSString *)pushErrorMessageWithDomain:(NSString *)domain
{
    return [self.localizedDescription pushMessageWithDomain:domain code:self.code];
}

@end
