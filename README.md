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