//
//  NormalCircle.h
//  SuQian
//
//  Created by Suraj on 24/9/12.
//  Copyright (c) 2012 Suraj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrangleInLine.h"

@interface NormalCircle : UIView

@property (nonatomic) BOOL selected;
@property (nonatomic) BOOL error;
@property (nonatomic) CGContextRef cacheContext;
@property (nonatomic,strong) TrangleInLine *arrow;


- (id)initwithRadius:(CGFloat)radius;

- (void)highlightCell;
- (void)resetCell;
-(void)showArrow:(CGPoint)endPoint;

@end
