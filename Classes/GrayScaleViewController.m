    //
//  GrayScaleViewController.m
//  GradientExample
//
//  Created by Shakir Ali on 23/05/2011.
//  Copyright 2011 University of Edinburgh. All rights reserved.
//

#import "GrayScaleViewController.h"


@implementation GrayScaleViewController

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	UIView* view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
	self.view = view;
	self.view.backgroundColor = [UIColor grayColor];
	[view release];
}


UIImage* createGrayScaleImage(UIImage* originalImage){
	//create gray device colorspace.
	CGColorSpaceRef space = CGColorSpaceCreateDeviceGray();
	//create 8-bit bimap context without alpha channel.
	CGContextRef bitmapContext = CGBitmapContextCreate(NULL, originalImage.size.width, originalImage.size.height, 8, 0, space, kCGImageAlphaNone);
	CGColorSpaceRelease(space);
	//Draw image.
	CGRect bounds = CGRectMake(0.0, 0.0, originalImage.size.width, originalImage.size.height);
	CGContextDrawImage(bitmapContext, bounds, originalImage.CGImage);
	//Get image from bimap context.
	CGImageRef grayScaleImage = CGBitmapContextCreateImage(bitmapContext);
	CGContextRelease(bitmapContext);
	//image is inverted. UIImage inverts orientation while converting CGImage to UIImage. 
	UIImage* image = [UIImage imageWithCGImage:grayScaleImage];
	CGImageRelease(grayScaleImage);
	return image;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	//load original image.
	UIImage* originalImage = [UIImage imageNamed:@"bus"];
	//init original image view.
	UIImageView* originalImageView = [[UIImageView alloc] initWithImage:originalImage];
	CGRect frame = originalImageView.frame;
	frame.origin = CGPointMake((self.view.frame.size.width - frame.size.width) / 2, 10.0);
	originalImageView.frame = frame;
	[self.view addSubview:originalImageView];
	[originalImageView release];
	
	//create grayscale image of original image.
	UIImage* reflectedImage = createGrayScaleImage(originalImage);
	//load image into imageview.
	UIImageView* reflectedImageView = [[UIImageView alloc] initWithImage:reflectedImage];
	frame = reflectedImageView.frame;
	frame.origin = CGPointMake((self.view.frame.size.width - frame.size.width) / 2 , (self.view.frame.size.height - frame.size.height) /2 );
	reflectedImageView.frame = frame;
	[self.view addSubview:reflectedImageView];
	[reflectedImageView release];
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
