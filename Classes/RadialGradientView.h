//
//  RadialGradientView.h
//  GradientExample
//
//  Created by Shakir Ali on 22/05/2011.
//  Copyright 2011 University of Edinburgh. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RadialGradientView : UIView {
	@private
	CGGradientDrawingOptions options;
}

-(id)initWithFrame:(CGRect)frame withGradientOptions:(CGGradientDrawingOptions)options;
@end
