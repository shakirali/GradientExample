//
//  RoundedRectView.h
//  GradientExample
//
//  Created by Shakir Ali on 21/05/2011.
//  Copyright 2011 University of Edinburgh. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LinearGradientView : UIView {
	@private
	CGFloat radius;
}

- (id)initWithFrame:(CGRect)frame Radius:(CGFloat)radius;
@property BOOL requireGradient;
@end
