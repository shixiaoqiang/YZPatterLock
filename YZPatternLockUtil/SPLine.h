//
//  SPLine.h
//  SuQian
//
//  Created by Suraj on 25/9/12.
//  Copyright (c) 2012 Suraj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SPLine : NSObject
@property (nonatomic,assign) CGPoint fromPoint;
@property (nonatomic,assign) CGPoint toPoint;
@property (nonatomic) BOOL    isFullLength;		// boolean to indicate if the line is a full edge or a partial edge

- (id)initWithFromPoint:(CGPoint)A toPoint:(CGPoint)B AndIsFullLength:(BOOL)isFullLength;

@end
