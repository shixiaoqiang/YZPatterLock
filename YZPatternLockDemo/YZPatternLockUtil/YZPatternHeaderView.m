//
//  YZPatternHeaderView.m
//  NTWallet
//
//  Created by user on 16/1/28.
//  Copyright © 2016年 熊盛. All rights reserved.
//

#import "YZPatternHeaderView.h"


@implementation YZPatternHeaderView{
    NSMutableArray    *_circles;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _circles = [NSMutableArray new];
        [self initSubViews];
        self.tag = 100;
    }
    return self;
}

-(void)initSubViews{
    self.backgroundColor = [UIColor clearColor];
    for (int i = 0; i<9; i++) {
        UIView *view = [UIView new];
        view.layer.cornerRadius = kRadius;
        view.tag = i;
        view.layer.masksToBounds = YES;
        view.layer.borderColor = kDefaultStrokeColor.CGColor;
        view.layer.borderWidth = 1;
        [self addSubview:view];
        [_circles addObject:view];
    }
}


-(void)setNum:(NSNumber *)num{
    NSInteger no = [num integerValue];
    while (no%10 > 0) {
         UIView *view = [self viewWithTag:no%10 -1 ];
        view.backgroundColor = kHighlightStrokeColor;
        view.layer.borderColor = kHighlightStrokeColor.CGColor;
        no = no/10;
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    for (int i = 0; i<9; i++) {
        UIView *view = _circles[i];
        view.frame = CGRectMake(0 + view.tag%3*((self.frame.size.width-2*kRadius)/2), 0 + view.tag/3*((self.frame.size.height-2*kRadius)/2), 2*kRadius, 2*kRadius);
    }
}

@end
