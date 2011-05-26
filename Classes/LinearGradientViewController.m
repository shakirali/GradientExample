    //
//  LinearGradientViewController.m
//  GradientExample
//
//  Created by Shakir Ali on 21/05/2011.
//  Copyright 2011 University of Edinburgh. All rights reserved.
//

#import "LinearGradientViewController.h"
#import "LinearGradientView.h"

@interface LinearGradientViewController ()
-(void)displayRoundedRect;
@end


@implementation LinearGradientViewController
#define RADIUS 20.0

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	UIView* view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
	self.view = view;
	[view release];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	[self displayRoundedRect];
}

-(void)displayRoundedRect{
	//Display rect without gradient.
	CGRect frame = CGRectMake((self.view.frame.size.width - 200) / 2 , 10, 200, 80);
	LinearGradientView* rectView = [[LinearGradientView alloc] initWithFrame:frame Radius:RADIUS];
	[self.view addSubview:rectView];
	[rectView release];
	
	//Display rect with gradient.
	//offset rect
	frame = CGRectOffset(frame, 0.0, frame.size.height + 10.0);
	rectView = [[LinearGradientView alloc] initWithFrame:frame Radius:RADIUS];
	rectView.requireGradient = YES;
	[self.view addSubview:rectView];
	[rectView release];
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
