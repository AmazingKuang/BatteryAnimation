
//
//  BABatterView.m
//  BatteryAnimation
//
//  Created by GAPSD on 2018/10/23.
//  Copyright © 2018年 GAPSD. All rights reserved.
//

#import "BABatterView.h"
#import "BAView.h"

@interface BABatterView ()
{
    NSInteger _maxNum;
    UIColor *_defaultColor;
    UIColor *_highlightColor;
}

@end

@implementation BABatterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
    }
    return self;
}

- (instancetype)initWithMaxNum:(NSInteger)maxNum defaultColor:(UIColor *)defaultColor highlightColor:(UIColor *)highlightColor frame:(CGRect)frame
{
    _maxNum = maxNum;
    _defaultColor = defaultColor;
    _highlightColor = highlightColor;
    return [self initWithFrame:frame];
}

- (void)buildUI
{
    if (!(_maxNum>0)) {
        _maxNum = 5;
    }
    if (!_defaultColor) {
        _defaultColor = [UIColor lightGrayColor];
    }
    if (!_highlightColor) {
        _highlightColor = [UIColor greenColor];
    }
    
    CGFloat margin = 5.f;
    
    for (int i =0; i < _maxNum;i++ ) {
        
        CGFloat batteryViewW = self.bounds.size.width;
        CGFloat batteryViewH = (self.bounds.size.height - margin*_maxNum)*0.21;
        CGFloat batteryViewY = i *(batteryViewH + margin);
        BAView *batteryView = [[BAView alloc] initWithFrame:CGRectMake(0, batteryViewY, batteryViewW, batteryViewH)];
        batteryView.corners = UIRectCornerAllCorners;
        batteryView.borderWidth = 0;
        batteryView.tag = _maxNum-i;
        batteryView.backgroundColor = _defaultColor;
        [self addSubview:batteryView];
    }
    
    
}

- (void)setCurrentNum:(NSInteger)currentNum
{
    NSArray *AllViews = [self subviews];
    for (BAView *batteryView in AllViews) {
        if (batteryView.tag<=currentNum) {
            batteryView.backgroundColor = _highlightColor;
        }else{
            batteryView.backgroundColor = _defaultColor;
        }
    }
}


@end
