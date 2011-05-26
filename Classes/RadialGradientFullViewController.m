    //
//  RadialGradientFullViewController.m
//  GradientExample
//
//  Created by Shakir Ali on 22/05/2011.
//  Copyright 2011 University of Edinburgh. All rights reserved.
//

#import "RadialGradientFullViewController.h"
#import "RadialGradientView.h"

@implementation RadialGradientFullViewController

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	UIView* view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
	self.view = view;
	[view release];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	CGRect frame = self.view.bounds;
	RadialGradientView* radialGradientView = [[RadialGradientView alloc] initWithFrame:frame withGradientOptions:kCGGradientDrawsAfterEndLocation];
	[self.view addSubview:radialGradientView];
	[radialGradientView release];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}


- (void)dealloc {
    [super dealloc];
}


@end
