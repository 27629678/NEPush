//
//  IOSVersion.m
//  mail
//
//  Created by oldman on 14-4-1.
//  Copyright (c) 2014年 NetEase (Hangzhou) Network Co., Ltd. All rights reserved.
//

#import "IOSVersion.h"

#import <sys/sysctl.h>
#import <UIKit/UIKit.h>

@interface IOSVersion ()
@property (nonatomic) NSString* systemVersion;
@property (nonatomic) NSString *osBuildVersion;
@end

@implementation IOSVersion

+ (instancetype)sharedInstance
{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.systemVersion = [[UIDevice currentDevice] systemVersion];
        self.osBuildVersion = [IOSVersion retrieveBuildVersion];
    }
    return self;
}

+ (NSString *)retrieveBuildVersion
{
    int mib[2] = {CTL_KERN, KERN_OSVERSION};
    u_int namelen = sizeof(mib) / sizeof(mib[0]);
    size_t bufferSize = 0;
    
    NSString *osBuildVersion = nil;
    
    // Get the size for the buffer
    sysctl(mib, namelen, NULL, &bufferSize, NULL, 0);
    
    u_char buildBuffer[bufferSize];
    int result = sysctl(mib, namelen, buildBuffer, &bufferSize, NULL, 0);
    
    if (result >= 0) {
        // Terminated by '\0'
        if (bufferSize > 0 && buildBuffer[bufferSize-1] == 0) {
            bufferSize--;
        }
        osBuildVersion = [[NSString alloc] initWithBytes:buildBuffer length:bufferSize encoding:NSUTF8StringEncoding];
    }
    
    return osBuildVersion;
}

+ (NSComparisonResult)compare:(NSString *)otherVersion
{
    return [[IOSVersion version] compare:otherVersion options:NSNumericSearch];
}

+ (BOOL)isLowerThanIOS7
{
    return NSOrderedAscending == [self compare:@"7.0"];
}

+ (BOOL)isLowerThanIOS8
{
    return NSOrderedAscending == [self compare:@"8.0"];
}

+ (BOOL)isLowerThanIOS9
{
    return NSOrderedAscending == [self compare:@"9.0"];
}

+ (BOOL)isLowerThanIOS8_1{
    return NSOrderedAscending == [self compare:@"8.1"];
}

+ (BOOL)isLowerThanIOS10{
    return NSOrderedAscending == [self compare:@"10.0"];
}

+ (BOOL)isNoLessThanIOS10 {
    return NSOrderedDescending == [self compare:@"10.0"] || NSOrderedSame == [self compare:@"10.0"];
}

+ (NSString *)version
{
    return [[IOSVersion sharedInstance] systemVersion];
}

+ (NSString*)buildVersion
{
    return [[IOSVersion sharedInstance] osBuildVersion];
}

+ (void)runFor7_1Lower:(void (^)())lowerBlock for8_0Later:(void (^)())laterBlock
{
    if ([IOSVersion isLowerThanIOS8]) {
        if (lowerBlock) {
            lowerBlock();
        }
    } else {
        if (laterBlock) {
            laterBlock();
        }
    }
}

+ (void)runFor8_1Lower:(void (^)())lowerBlock for8_1Later:(void (^)())laterBlock{
    if ([IOSVersion isLowerThanIOS8_1]) {
        if (lowerBlock) {
            lowerBlock();
        }
    }else{
        if (laterBlock) {
            laterBlock();
        }
    }
}

@end
