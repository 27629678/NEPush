//
//  NEPushAuthInfo.h
//  mail
//
//  Created by hzyuxiaohua on 2016/10/19.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NEPushAuthInfo : NSObject

@property (nonatomic, readonly) NSUInteger options;

@property (nonatomic, readonly) NSSet* uiCategories;

@property (nonatomic, readonly) NSSet* unCategories;

- (instancetype)initWithJson:(NSString *)json;

@end
