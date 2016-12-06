# NEPush

How to use:

```
- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// generate notification config string
    NSString* json = [NEPushNotificationCategoryGenerator json];
    
    // register config with string and handler
    [NEPushManager registerNotificationWithJson:json handler:self];
    
    return YES;
}
```

and implement following `NEPushNotificationDelegate ` protocol methods:

```
@protocol NEPushNotificationDelegate <NSObject>

@required

// fetch device token
- (void)pushServiceDidReceiveDeviceToken:(NSString *)token;

// return error when register remote notification
- (void)pushServiceRegisterNotificationWithError:(NSError *)error;

// handle notification action
- (void)pushServiceHandleActionWithIdentifier:(NSString *)identifier userInfo:(NSDictionary *)userInfo complete:(void(^)())complete;

// handle local and remote notification
- (void)pushServiceDidReceiveNotification:(NSDictionary *)userInfo isRemote:(BOOL)isRemote complete:(void (^)(UIBackgroundFetchResult))complete;

@end
```