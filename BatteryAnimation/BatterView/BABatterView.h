//
//  BABatterView.h
//  BatteryAnimation
//
//  Created by GAPSD on 2018/10/23.
//  Copyright © 2018年 GAPSD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BABatterView : UIView

@property(nonatomic,assign) NSInteger currentNum;

- (instancetype)initWithMaxNum:(NSInteger)maxNum defaultColor:(UIColor *)defaultColor highlightColor:(UIColor *)highlightColor frame:(CGRect)frame;

@end
