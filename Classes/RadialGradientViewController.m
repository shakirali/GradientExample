    //
//  RadialGradientViewController.m
//  GradientExample
//
//  Created by Shakir Ali on 22/05/2011.
//  Copyright 2011 University of Edinburgh. All rights reserved.
//

#import "RadialGradientViewController.h"
#import "RadialGradientView.h"

@interface RadialGradientViewController ()
-(void)drawRadialGradient;
-(void)drawRadialGradientExtendStart;
-(void)drawRadialGradientExtendEnd;
@end

@implementation RadialGradientViewController

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	UIView* view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
	self.view = view;
	[view release];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	[self drawRadialGradient];
	[self drawRadialGradientExtendStart];
	[self drawRadialGradientExtendEnd];
}

-(void)drawRadialGradient{
	CGRect frame = CGRectMake((self.view.frame.size.width - 200)/2, 10.0, 100, 100);
	RadialGradientView* radialGradientView = [[RadialGradientView alloc] initWithFrame:frame withGradientOptions:0];
	[self.view addSubview:radialGradientView];
	[radialGradientView release];
}

-(void)drawRadialGradientExtendStart{
	CGRect frame = CGRectMake((self.view.frame.size.width - 200)/2, 120.0, 100, 100);
	RadialGradientView* radialGradientView = [[RadialGradientView alloc] initWithFrame:frame withGradientOptions:kCGGradientDrawsBeforeStartLocation];
	[self.view addSubview:radialGradientView];
	[radialGradientView release];

}

-(void)drawRadialGradientExtendEnd{
	CGRect frame = CGRectMake((self.view.frame.size.width - 200)/2, 240.0, 100, 100);
	RadialGradientView* radialGradientView = [[RadialGradientView alloc] initWithFrame:frame withGradientOptions:kCGGradientDrawsAfterEndLocation];
	[self.view addSubview:radialGradientView];
	[radialGradientView release];
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)dealloc {
    [super dealloc];
}


@end
