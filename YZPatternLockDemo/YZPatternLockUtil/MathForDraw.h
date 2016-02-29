//
//  MathForDraw.h
//  NTWallet
//
//  Created by YZ on 16/1/28.
//  Copyright © 2016年 YZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MathForDraw : NSObject

+(CGFloat)distanceFromPoint:(CGPoint)start toPoint:(CGPoint)end;
+(CGPoint)pointInLineFromPoint:(CGPoint)start toPoint:(CGPoint)end AndLengthFromEnd:(CGFloat)length;
+(CGPoint)pointInLineFromPoint:(CGPoint)start toPoint:(CGPoint)end AndLengthFromStart:(CGFloat)length;

+(CGFloat)distanceBetweenPoints:(CGPoint)first andPoint:(CGPoint)second;
+(CGFloat)angleBetweenPoints:(CGPoint)first andPoint:(CGPoint)second ;
+(CGFloat)angleBetweenLines:(CGPoint)line1Start andPoint:(CGPoint)line1End and:(CGPoint)line2Start andPoint:(CGPoint)line2End ;

@end
