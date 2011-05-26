//
//  GradientExampleAppDelegate.h
//  GradientExample
//
//  Created by Shakir Ali on 21/05/2011.
//  Copyright 2011 University of Edinburgh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GradientTypesTableViewController;

@interface GradientExampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController *navController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (retain) UINavigationController *navController;

@end

