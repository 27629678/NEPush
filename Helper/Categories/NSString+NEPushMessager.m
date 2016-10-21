//
//  NSString+NEPushMessager.m
//  mail
//
//  Created by hzyuxiaohua on 2016/10/18.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import "NSString+NEPushMessager.h"

#import "NEPushConstants.h"

@implementation NSString (NEPushMessager)

- (NSString *)authMessage
{
    return [self pushMessageWithDomain:kNEPushAuthDomain];
}

- (NSString *)pushMessageWithDomain:(NSString *)domain
{
    return [self pushMessageWithDomain:domain code:0];
}

- (NSString *)pushMessageWithDomain:(NSString *)domain code:(NSInteger)code
{
    NSString* message = nil;
    if (code == 0) {
        message = [NSString stringWithFormat:@"<NEPush.Domain:%@.Msg:%@>", domain, self];
    }
    else {
        message = [NSString stringWithFormat:@"<NEPush.Domain:%@.Code:%@.Msg:%@>", domain, @(code), self];
    }
    
    return message;
}

@end
