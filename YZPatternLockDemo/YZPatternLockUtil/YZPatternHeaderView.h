//
//  YZPatternHeaderView.h
//  NTWallet
//
//  Created by YZ on 16/1/28.
//  Copyright © 2016年 YZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kDefaultStrokeColor [UIColor colorWithRed:82.0/255.0 green:86.0/255.0 blue:120.0/255.0 alpha:1]
#define kHighlightStrokeColor [UIColor colorWithRed:119.0/255.0 green:178.0/255.0 blue:255.0/255.0 alpha:1]
#define kRadius   5


@interface YZPatternHeaderView : UIView

-(void)setNum:(NSNumber *)num;

@end
