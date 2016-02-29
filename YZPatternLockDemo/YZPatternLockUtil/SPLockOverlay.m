//
//  SPLockOverlay.m
//  SuQian
//
//  Created by Suraj on 25/9/12.
//  Copyright (c) 2012 Suraj. All rights reserved.
//

#import "SPLockOverlay.h"
#import "MathForDraw.h"

#define kLineColor			[UIColor colorWithRed:255.0/255.0 green:252.0/255.0 blue:78.0/255.0 alpha:0.9]
#define kLineGridColor  [UIColor colorWithRed:255.0/255.0 green:252.0/255.0 blue:233.0/255.0 alpha:1.0]

#define kDefaultStrokeColor [UIColor colorWithRed:82.0/255.0 green:86.0/255.0 blue:120.0/255.0 alpha:1]
#define kHighlightStrokeColor [UIColor colorWithRed:119.0/255.0 green:178.0/255.0 blue:255.0/255.0 alpha:1]
#define kErrorColor [UIColor colorWithRed:255.0/255.0 green:100/255.0 blue:126/255.0 alpha:1]

@implementation SPLockOverlay

@synthesize pointsToDraw;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
			self.backgroundColor = [UIColor clearColor];
			self.pointsToDraw = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGFloat lineWidth = 5.0;
    CGContextSetLineWidth(context, lineWidth);
    if (_error) {
        CGContextSetStrokeColorWithColor(context, kErrorColor.CGColor);
        for(SPLine *line in self.pointsToDraw)
        {
            CGContextMoveToPoint(context, line.fromPoint.x, line.fromPoint.y);
            CGContextAddLineToPoint(context, line.toPoint.x, line.toPoint.y);
            CGContextStrokePath(context);
        }
    }else{
        CGContextSetStrokeColorWithColor(context, kHighlightStrokeColor.CGColor);
        for(SPLine *line in self.pointsToDraw)
        {
            CGContextMoveToPoint(context, line.fromPoint.x, line.fromPoint.y);
            CGContextAddLineToPoint(context, line.toPoint.x, line.toPoint.y);
            CGContextStrokePath(context);
        }
    }
	
    _error = NO;
	
}


@end
