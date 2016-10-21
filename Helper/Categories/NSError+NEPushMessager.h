//
//  NSError+NEPushMessager.h
//  mail
//
//  Created by hzyuxiaohua on 2016/10/18.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (NEPushMessager)

- (NSString *)authErrorMessage;

- (NSString *)pushErrorMessageWithDomain:(NSString *)domain;

@end
