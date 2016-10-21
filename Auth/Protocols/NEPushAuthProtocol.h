//
//  NEPushAuthProtocol.h
//  mail
//
//  Created by hzyuxiaohua on 2016/10/18.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NEPushAuthInfo.h"
#import "NEPushConstants.h"

@protocol NEPushAuthProtocol <NSObject>

@required
- (BOOL)authWithJson:(NSString *)json;

@end
