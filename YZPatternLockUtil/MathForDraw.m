//
//  MathForDraw.m
//  NTWallet
//
//  Created by user on 16/1/28.
//  Copyright © 2016年 熊盛. All rights reserved.
//

#import "MathForDraw.h"

#define degreesToRadian(x) (M_PI * x / 180.0)
#define radiansToDegrees(x) (180.0 * x / M_PI)

@implementation MathForDraw

+(CGFloat)distanceFromPoint:(CGPoint)start toPoint:(CGPoint)end{
    CGFloat distance;
    CGFloat xDist = (end.x - start.x);
    CGFloat yDist = (end.y - start.y);
    distance = sqrt((xDist * xDist) + (yDist * yDist));
    return distance;
}

+(CGPoint)pointInLineFromPoint:(CGPoint)start toPoint:(CGPoint)end AndLengthFromStart:(CGFloat)length{
    CGFloat dis = [self distanceFromPoint:start toPoint:end];
    CGPoint newPoint = CGPointMake(length/dis*(end.x - start.x)+start.x, length/dis*(end.y - start.y)+start.y);
    return newPoint;
}

+(CGPoint)pointInLineFromPoint:(CGPoint)start toPoint:(CGPoint)end AndLengthFromEnd:(CGFloat)length{
    CGFloat dis = [self distanceFromPoint:start toPoint:end];
    CGPoint newPoint =CGPointMake(end.x - length/dis*(end.x - start.x),end.y - length/dis*(end.y - start.y));
    return newPoint;
}


+(CGFloat)distanceBetweenPoints:(CGPoint)first andPoint:(CGPoint)second {
    CGFloat deltaX = second.x - first.x;
    CGFloat deltaY = second.y - first.y;
    return sqrt(deltaX*deltaX + deltaY*deltaY );
};


+(CGFloat)angleBetweenPoints:(CGPoint)first andPoint:(CGPoint)second {
    CGFloat height = second.y - first.y;
    CGFloat width = first.x - second.x;
    CGFloat rads = atan(height/width);
    return rads;
//    return radiansToDegrees(rads);
    //degs = degrees(atan((top - bottom)/(right - left)))
}

+(CGFloat)angleBetweenLines:(CGPoint)line1Start andPoint:(CGPoint)line1End and:(CGPoint)line2Start andPoint:(CGPoint)line2End{
    
    CGFloat a = line1End.x - line1Start.x;
    CGFloat b = line1End.y - line1Start.y;
    CGFloat c = line2End.x - line2Start.x;
    CGFloat d = line2End.y - line2Start.y;
    
    CGFloat rads = acos(((a*c) + (b*d)) / ((sqrt(a*a + b*b)) * (sqrt(c*c + d*d))));
    if (c<0) {
        rads = 2*M_PI - rads;
    }
    return rads;
//    return radiansToDegrees(rads);
    
}

@end
