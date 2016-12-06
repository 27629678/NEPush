//
//  NEPushAuthInfo.m
//  mail
//
//  Created by hzyuxiaohua on 2016/10/19.
//  Copyright © 2016年 XY Co., Ltd. All rights reserved.
//

#import "NEPushAuthInfo.h"

#import "NEPushAction.h"
#import "NEPushActionCategory.h"

#import "NSError+NEPushMessager.h"

#import <UserNotifications/UserNotifications.h>

@interface NEPushAuthInfo ()

@property (nonatomic, copy) NSDictionary* authDict;
@property (nonatomic, strong) NSArray* categories;

@end

@implementation NEPushAuthInfo

- (instancetype)initWithJson:(NSString *)json
{
    if (self = [super init]) {
        NSError* error = nil;
        NSData* data = [json dataUsingEncoding:NSUTF8StringEncoding];
        if (data.length == 0) {
            return nil;
        }
        
        NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (error) {
            NSLog(@"%@", [error pushErrorMessageWithDomain:@"NEPushServiceHelper"]);
            return nil;
        }
        
        self.authDict = dict;
    }
    
    return self;
}

- (NSUInteger)options
{
    NSNumber* number = [self.authDict objectForKey:@"options"];
    if (![number isKindOfClass:[NSNumber class]]) {
        NSCAssert(NO, @"");
        return 0;
    }
    
    return number.unsignedIntegerValue;
}

- (NSSet *)unCategories
{
    NSArray* items = [self.authDict objectForKey:@"categories"];
    if (![items isKindOfClass:[NSArray class]]) {
        NSCAssert(NO, @"");
        return [NSSet set];
    }
    
    NSMutableArray* categories = [NSMutableArray array];
    for (id item in items) {
        UNNotificationCategory* category = [self unCategoryFromDict:item];
        if (!category) {
            NSCAssert(NO, @"");
            continue;
        }
        
        [categories addObject: category];
    }
    
    return [NSSet setWithArray:categories];
}

- (NSSet *)uiCategories
{
    NSArray* items = [self.authDict objectForKey:@"categories"];
    if (![items isKindOfClass:[NSArray class]]) {
        NSCAssert(NO, @"");
        return [NSSet set];
    }
    
    NSMutableArray* categories = [NSMutableArray array];
    for (id item in items) {
        UIUserNotificationCategory* category = [self uiCategoryFromDict:item];
        if (!category) {
            NSCAssert(NO, @"");
            continue;
        }
        
        [categories addObject: category];
    }
    
    return [NSSet setWithArray:categories];
}

#pragma mark - private

- (UNNotificationCategory *)unCategoryFromDict:(NSDictionary *)dict
{
    if (![dict isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    NSString* identifier = [dict objectForKey:@"identifier"];
    if (![identifier isKindOfClass:[NSString class]] || identifier.length == 0) {
        return nil;
    }
    
    NSArray* items = [dict objectForKey:@"actions"];
    if (![items isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSMutableArray* actions = [NSMutableArray arrayWithCapacity:items.count];
    for (id item in items) {
        NEPushAction* action = [self actionFromDict:item];
        if (!action) {
            continue;
        }
        
        [actions addObject:action.unAction];
    }
    
    if (actions.count == 0) {
        return nil;
    }
    
    NEPushActionCategory* category = [[NEPushActionCategory alloc] init];
    category.identifier = identifier;
    
    return [category unCategoryWithActions:actions];
}

- (UIUserNotificationCategory *)uiCategoryFromDict:(NSDictionary *)dict
{
    if (![dict isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    NSString* identifier = [dict objectForKey:@"identifier"];
    if (![identifier isKindOfClass:[NSString class]] || identifier.length == 0) {
        return nil;
    }
    
    NSArray* items = [dict objectForKey:@"actions"];
    if (![items isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSMutableArray* actions = [NSMutableArray arrayWithCapacity:items.count];
    for (id item in items) {
        NEPushAction* action = [self actionFromDict:item];
        if (!action) {
            continue;
        }
        
        [actions addObject:action.uiAction];
    }
    
    if (actions.count == 0) {
        return nil;
    }
    
    NEPushActionCategory* category = [[NEPushActionCategory alloc] init];
    category.identifier = identifier;
    
    return [category uiCategoryWithActions:actions];
}

- (NEPushAction *)actionFromDict:(NSDictionary *)dict
{
    if (![dict isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    NSString* identifier = [dict objectForKey:@"identifier"];
    if (![identifier isKindOfClass:[NSString class]] || identifier.length == 0) {
        return nil;
    }
    
    NSString* title = [dict objectForKey:@"titile"];
    if (![title isKindOfClass:[NSString class]] || title.length == 0) {
        return nil;
    }
    
    NSNumber* options = [dict objectForKey:@"options"];
    
    NEPushAction* action = [[NEPushAction alloc] init];
    action.title = title;
    action.identifier = identifier;
    action.options = options.unsignedIntegerValue;
    
    return action;
}

@end
