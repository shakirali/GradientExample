//
//  RoundedRectView.m
//  GradientExample
//
//  Created by Shakir Ali on 21/05/2011.
//  Copyright 2011 University of Edinburgh. All rights reserved.
//

#import "LinearGradientView.h"

@interface LinearGradientView ()
-(void)drawRoundedRectangle:(CGRect)rect inContext:(CGContextRef)context;
-(void)drawGradientInRect:(CGRect)rect context:(CGContextRef)context;
-(void)applyGradientInRect:(CGRect)rect context:(CGContextRef)context;
@end


@implementation LinearGradientView
@synthesize requireGradient;

- (id)initWithFrame:(CGRect)frame Radius:(CGFloat)inRadius{
    
    self = [super initWithFrame:frame];
    if (self) {
        radius = inRadius;
		//set the background color of view.
		self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
	//Draw white boundary around the rectangle.
	CGContextSetLineWidth(context, 0.5);
	CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
	//Get the rectangle which is surrounded by white boundary. 
	CGRect insetRect = CGRectInset(rect, 0.5, 0.5);
	//Fill rectangle with blue color.
	CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
	//Draw rounded rectangle.	
	CGContextBeginPath(context);
	[self drawRoundedRectangle:rect inContext:context];
	CGContextClosePath(context);
	CGContextDrawPath(context, kCGPathFillStroke);
	
	if ([self requireGradient])
		[self applyGradientInRect:insetRect context:context];
}


//Draws rounded rectangle.
-(void)drawRoundedRectangle:(CGRect)rect inContext:(CGContextRef)context{
	CGFloat minx = CGRectGetMinX(rect), midx = CGRectGetMidX(rect), maxx= CGRectGetMaxX(rect);
	CGFloat miny = CGRectGetMinX(rect), midy = CGRectGetMidY(rect), maxy = CGRectGetMaxY(rect);
	CGContextMoveToPoint(context, minx, midy);
	CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
	CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
	CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
	CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
}

-(void)applyGradientInRect:(CGRect)rect context:(CGContextRef)context{
	//Clip gradient path.
	CGContextBeginPath(context);
	[self drawRoundedRectangle:rect inContext:context];
	CGContextClosePath(context);
	CGContextClip(context);
	//Draw gradient.
	[self drawGradientInRect:rect context:context];
}
	
//Draw gradient.
-(void)drawGradientInRect:(CGRect)rect context:(CGContextRef)context{
	CGGradientRef gradient;
	//start and end points of gradient.
	CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
	CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
	//locations of color defined in components.
	CGFloat locations[2] = {0.0, 1.0};
	//color components array. In this case color is same i.e white but we are changing the alpha value.
	CGFloat components[8] = { 1.0, 1.0, 1.0, 0.0,
		1.0, 1.0, 1.0, 0.7};
	//RGB color space.
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	//create gradient.
	gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);
	CGColorSpaceRelease(colorSpace);
	//draw gradient.
	CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
	CGGradientRelease(gradient);
}

- (void)dealloc {
    [super dealloc];
}


@end
