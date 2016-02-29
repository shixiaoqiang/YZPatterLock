//
//  ViewController.m
//  YZPatternLockDemo
//
//  Created by user on 16/2/29.
//  Copyright © 2016年 YZ. All rights reserved.
//

#import "ViewController.h"
#import "SPLockScreen.h"
#import "YZPatternHeaderView.h"
#import "TrangleInLine.h"

#define ScreenWIDTH   [UIScreen mainScreen].bounds.size.width
#define ScreenHEIGHT   [UIScreen mainScreen].bounds.size.height
#define kTextColor    [UIColor colorWithRed:37.0/255.0 green:37.0/255.0 blue:37.0/255.0 alpha:1]
#define kErrorColor [UIColor colorWithRed:255.0/255.0 green:100/255.0 blue:126/255.0 alpha:1]

@interface ViewController ()<LockScreenDelegate>
@property (weak, nonatomic) IBOutlet UILabel *messegeView;
@property (weak, nonatomic) IBOutlet YZPatternHeaderView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *saveLabe;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customSubViews];
    
}

-(void)customSubViews{
    SPLockScreen *lock = [[SPLockScreen alloc] init];
    lock.center = CGPointMake(ScreenWIDTH/2 , ScreenHEIGHT/2 + 40);
    lock.delegate = self;
    [self.view addSubview:lock];
    _saveLabe.hidden = YES;
}

-(void)viewDidDisappear:(BOOL)animated{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:nil forKey:@"patternNum"];
}


- (NSInteger)lockScreen:(SPLockScreen *)lockScreen didEndWithPattern:(NSNumber *)patternNumber{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    if ([def objectForKey:@"patternNum"]) {
        if ([patternNumber integerValue] == [[def objectForKey:@"patternNum"] integerValue]) {
            _messegeView.text = @"手势密码设置成功!";
            _messegeView.textColor = kTextColor;
            _saveLabe.hidden = NO;
            [self performSelector:@selector(popViewController) withObject:nil afterDelay:2];
            return 3;
        }else{
            _messegeView.text = @"两次绘制手势不一致，请重新绘制";
            _messegeView.textColor = kErrorColor;
            return 1;
        }
    }else{
        [def setObject:patternNumber forKey:@"patternNum"];
        _messegeView.text = @"请再次绘制手势密码";
        [_headerView setNum:patternNumber];
        return 0;
    }
    return 0;
}

-(void)popViewController{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
