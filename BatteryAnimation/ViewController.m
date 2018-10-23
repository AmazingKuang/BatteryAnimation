//
//  ViewController.m
//  BatteryAnimation
//
//  Created by GAPSD on 2018/10/23.
//  Copyright © 2018年 GAPSD. All rights reserved.
//

#import "ViewController.h"
#import "BABatterView.h"

@interface ViewController (){
    NSInteger _timeValue;
    BABatterView *_animationView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startAnimation];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(177, 95, 15, 5)];
    label.backgroundColor = [UIColor colorWithRed:0.25 green:0.24 blue:0.24 alpha:1];
    [self.view addSubview:label];
    UIView *bigview = [[UIView alloc] initWithFrame:CGRectMake(160, 100, 50, 100)];
    bigview.backgroundColor = [UIColor colorWithRed:0.4 green:0.39 blue:0.39 alpha:1];
    [self.view addSubview:bigview];
    _animationView = [[BABatterView alloc] initWithMaxNum:5 defaultColor:[UIColor colorWithRed:0.46 green:0.44 blue:0.44 alpha:1] highlightColor:[UIColor greenColor] frame:CGRectMake(10, 0, 30, 100)];
    [bigview addSubview:_animationView];
}
- (void)startAnimation
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    [timer fire];
}


- (void)timerMethod
{
    if (_timeValue>6) {
        _timeValue =0;
    }
    _animationView.currentNum = _timeValue;
    _timeValue++;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
