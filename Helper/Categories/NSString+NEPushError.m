//
//  NSString+NEPushError.m
//  mail
//
//  Created by hzyuxiaohua on 2016/10/18.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import "NSString+NEPushError.h"

#import "NEPushConstants.h"

@implementation NSString (NEPushError)

- (NSError *)authErrorWithCode:(NSInteger)code
{
    return [self pushErrorWithDomain:kNEPushAuthDomain code:code];
}

- (NSError *)pushErrorWithDomain:(NSString *)domain code:(NSInteger)code
{
    return [NSError errorWithDomain:domain code:code userInfo:@{NSLocalizedDescriptionKey:self}];
}

@end
