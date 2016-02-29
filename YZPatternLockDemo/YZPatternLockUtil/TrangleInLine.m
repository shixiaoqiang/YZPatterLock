//
//  TrangleInLine.m
//  NTWallet
//
//  Created by YZ on 16/1/29.
//  Copyright © 2016年 YZ. All rights reserved.
//

#import "TrangleInLine.h"

#define kDefaultStrokeColor [UIColor colorWithRed:82.0/255.0 green:86.0/255.0 blue:120.0/255.0 alpha:1]
#define kHighlightStrokeColor [UIColor colorWithRed:119.0/255.0 green:178.0/255.0 blue:255.0/255.0 alpha:1]
#define kErrorColor [UIColor colorWithRed:255.0/255.0 green:100/255.0 blue:126/255.0 alpha:1]

@implementation TrangleInLine

-(instancetype)init{
    self = [super initWithFrame:CGRectMake(0, 0, 10, 50)];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    CGContextRef context= UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 5, 0);
    CGContextAddLineToPoint(context, 0, 5);
    CGContextAddLineToPoint(context, 10, 5);
    CGContextClosePath(context);
    if (_error) {
        CGContextSetFillColorWithColor(context, kErrorColor.CGColor);
    }
    else{
        CGContextSetFillColorWithColor(context, kHighlightStrokeColor.CGColor);
    }
    
    CGContextFillPath(context);
    _error = NO;
}

@end
