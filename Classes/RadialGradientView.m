//
//  RadialGradientView.m
//  GradientExample
//
//  Created by Shakir Ali on 22/05/2011.
//  Copyright 2011 University of Edinburgh. All rights reserved.
//

#import "RadialGradientView.h"


@implementation RadialGradientView


- (id)initWithFrame:(CGRect)frame withGradientOptions:(CGGradientDrawingOptions)inOptions{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.backgroundColor = [UIColor colorWithRed:114/255 green:136/255 blue:166/255 alpha:0.0];
		options = inOptions;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
	//radial gradient centre point.
	CGPoint startCenter, endCenter;
	startCenter = endCenter = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
	//radial gradient radius;
	CGFloat startRadius = 0.0;
	CGFloat endRadius = CGRectGetMidX(rect) > CGRectGetMidY(rect) ? CGRectGetMidX(rect): CGRectGetMidY(rect);
	//gradient locations.
	CGFloat locations[2] = {0.0, 1.0};
	//gradient color components.
	//blueish color
	//CGFloat components[8] = {0.44,0.53,0.65,0.3,
	//	0.44, 0.53, 0.65, 0.9};
	//black color
	CGFloat components[8] = {0.0,0.0,0.0,0.3,
		0.0, 0.0, 0.0, 0.7};
	//Drawing code.
	CGContextRef context = UIGraphicsGetCurrentContext();
	//Get RGB color space
	CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
	//create gradient.
	CGGradientRef gradient = CGGradientCreateWithColorComponents(space, components, locations, 2);
	CGColorSpaceRelease(space);
	//draw gradient.
	CGContextDrawRadialGradient(context, gradient, startCenter, startRadius,endCenter,endRadius, options);
	CGGradientRelease(gradient);
}


- (void)dealloc {
    [super dealloc];
}


@end
