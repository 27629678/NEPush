//
//  NSString+NEPushMessager.h
//  mail
//
//  Created by hzyuxiaohua on 2016/10/18.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NEPushMessager)

- (NSString *)authMessage;

- (NSString *)pushMessageWithDomain:(NSString *)domain;

- (NSString *)pushMessageWithDomain:(NSString *)domain code:(NSInteger)code;

@end
