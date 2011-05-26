//
//  GradientExampleAppDelegate.m
//  GradientExample
//
//  Created by Shakir Ali on 21/05/2011.
//  Copyright 2011 University of Edinburgh. All rights reserved.
//

#import "GradientExampleAppDelegate.h"
#import "GradientTypesTableViewController.h"

@implementation GradientExampleAppDelegate

@synthesize window;
@synthesize navController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Add the view controller's view to the window and display.
	GradientTypesTableViewController *viewController = [[GradientTypesTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
	navController = [[UINavigationController alloc] initWithRootViewController:viewController];
	[viewController release];
	[self.window addSubview:navController.view];
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [navController release];
    [window release];
    [super dealloc];
}


@end