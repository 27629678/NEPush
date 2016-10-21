//
//  NSString+NEPushError.h
//  mail
//
//  Created by hzyuxiaohua on 2016/10/18.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NEPushError)

- (NSError *)authErrorWithCode:(NSInteger)code;

- (NSError *)pushErrorWithDomain:(NSString *)domain code:(NSInteger)code;

@end
