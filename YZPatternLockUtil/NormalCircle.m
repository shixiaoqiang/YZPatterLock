//
//  NormalCircle.m
//  SuQian
//
//  Created by Suraj on 24/9/12.
//  Copyright (c) 2012 Suraj. All rights reserved.
//

#import "NormalCircle.h"
#import <QuartzCore/QuartzCore.h>
#import "MathForDraw.h"
#import "TrangleInLine.h"

#define kOuterColor			[UIColor colorWithRed:128.0/255.0 green:127.0/255.0 blue:123.0/255.0 alpha:0.9]
#define kInnerColor			[UIColor colorWithRed:43.0/255.0 green:43.0/255.0 blue:43.0/255.0 alpha:0.75]
#define kHighlightColor	[UIColor colorWithRed:255.0/255.0 green:252.0/255.0 blue:78.0/255.0 alpha:0.9]

#define kDefaultStrokeColor [UIColor colorWithRed:82.0/255.0 green:86.0/255.0 blue:120.0/255.0 alpha:1]
#define kHighlightStrokeColor [UIColor colorWithRed:119.0/255.0 green:178.0/255.0 blue:255.0/255.0 alpha:1]
#define kErrorColor [UIColor colorWithRed:255.0/255.0 green:100/255.0 blue:126/255.0 alpha:1]
@implementation NormalCircle{
    CGFloat  _arrowRadian;
}
@synthesize selected,cacheContext;

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
	}
	return self;
}

- (id)initwithRadius:(CGFloat)radius
{
	CGRect frame = CGRectMake(0, 0, 2*radius, 2*radius);
	NormalCircle *circle = [self initWithFrame:frame];
	if (circle) {
		[circle setBackgroundColor:[UIColor clearColor]];
	}
    _arrow = [[TrangleInLine alloc] init];
    _arrow.hidden = YES;
    [self addSubview:_arrow];
	return circle;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _arrow.center = CGPointMake(self.center.x - self.frame.origin.x, self.center.y - self.frame.origin.y);
    _arrow.startPoint = CGPointMake(self.center.x, 0);
    _arrow.orginPoint = self.center;
}


- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	self.cacheContext = context;
	CGFloat lineWidth = 1.0;
    if (self.selected) {
        if (_error) {
            CGContextSetStrokeColorWithColor(context, kErrorColor.CGColor);
            CGContextSetFillColorWithColor(context, kErrorColor.CGColor);
        }else{
            CGContextSetStrokeColorWithColor(context, kHighlightStrokeColor.CGColor);
            CGContextSetFillColorWithColor(context, kHighlightStrokeColor.CGColor);
        }
        CGRect rectToDraw = CGRectMake(rect.origin.x+lineWidth, rect.origin.y+lineWidth, rect.size.width-2*lineWidth, rect.size.height-2*lineWidth);
        CGContextStrokeEllipseInRect(context, rectToDraw);
        CGRect innerEllipseRect = CGRectInset(rect, 17, 17);
        
        CGContextFillEllipseInRect(context, innerEllipseRect);
    }else{
        CGRect rectToDraw = CGRectMake(rect.origin.x+lineWidth, rect.origin.y+lineWidth, rect.size.width-2*lineWidth, rect.size.height-2*lineWidth);
        CGContextSetLineWidth(context, lineWidth);
        CGContextSetStrokeColorWithColor(context, kDefaultStrokeColor.CGColor);
        CGContextStrokeEllipseInRect(context, rectToDraw);
    }
    _error = NO;
}

- (void)highlightCell
{
	self.selected = YES;
    [self.arrow setNeedsDisplay];
	[self setNeedsDisplay];
}

- (void)resetCell
{
	self.selected = NO;
	[self setNeedsDisplay];
    _arrow.transform = CGAffineTransformRotate(_arrow.transform, -_arrowRadian);
    _arrowRadian = 0;
    _arrow.hidden = YES;
}

-(void)showArrow:(CGPoint)endPoint{
    _arrowRadian =[MathForDraw angleBetweenLines:_arrow.orginPoint andPoint:_arrow.startPoint and:_arrow.orginPoint andPoint:endPoint];
    _arrow.transform = CGAffineTransformRotate(_arrow.transform, _arrowRadian);
    _arrow.hidden = NO;    
}


@end
