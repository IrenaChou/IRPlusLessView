//
//  IRPlusLess.m
//  IRPlusLess
//
//  Created by zhongdai on 16/8/18.
//  Copyright © 2016年 irena. All rights reserved.
//  加减控件

#import "IRPlusLessView.h"

@interface IRPlusLessView ()
/**
 *  显示数字
 */
@property(nonatomic, weak) UILabel *numLabel;
/**
 *  减号按钮
 */
@property(nonatomic, weak) UIButton *lessBtn;
/**
 *  加号按钮
 */
@property(nonatomic, weak) UIButton *plusBtn;

@end

@implementation IRPlusLessView

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    //    UIButton *lessBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    _lessBtn = lessBtn;
    //    [lessBtn setTitle:@"-" forState:UIControlStateNormal];
    //    [lessBtn setTitleColor:[UIColor blueColor]
    //    forState:UIControlStateNormal];
    //    [lessBtn setTitleColor:[UIColor grayColor]
    //    forState:UIControlStateDisabled];
    //
    //    CGFloat fontSize = frame.size.height - frame.size.height * 0.3;
    //    lessBtn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    //    lessBtn.enabled = NO;
    //    [lessBtn addTarget:self
    //                  action:@selector(less:)
    //        forControlEvents:UIControlEventTouchUpInside];

    UIButton *lessBtn =
        [self buttonWithTitle:@"-" superHeight:frame action:@selector(less:)];
    lessBtn.enabled = NO;
    _lessBtn = lessBtn;

    UILabel *numLabel = [[UILabel alloc] init];
    numLabel.textAlignment = NSTextAlignmentCenter;
    numLabel.font = [UIFont boldSystemFontOfSize:frame.size.height * 0.4];
    numLabel.text = @"1";
    _numLabel = numLabel;

    //    UIButton *plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [plusBtn setTitleColor:[UIColor grayColor]
    //    forState:UIControlStateDisabled];
    //    _plusBtn = plusBtn;
    //    [plusBtn setTitle:@"+" forState:UIControlStateNormal];
    //    [plusBtn setTitleColor:[UIColor blueColor]
    //    forState:UIControlStateNormal];
    //    plusBtn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    //    [plusBtn addTarget:self
    //                  action:@selector(plus:)
    //        forControlEvents:UIControlEventTouchUpInside];

    UIButton *plusBtn =
        [self buttonWithTitle:@"+" superHeight:frame action:@selector(plus:)];
    _plusBtn = plusBtn;

    UIStackView *stackView = [[UIStackView alloc]
        initWithArrangedSubviews:@[ lessBtn, numLabel, plusBtn ]];
    stackView.frame = self.bounds;
    [self addSubview:stackView];

    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.distribution = UIStackViewDistributionFillEqually;

    self.layer.borderColor = [[UIColor blueColor] CGColor];
    self.layer.borderWidth = 2.0;
    self.layer.cornerRadius = 15;
    self.layer.masksToBounds = YES;
  }
  return self;
}
- (UIButton *)buttonWithTitle:(NSString *)title
                  superHeight:(CGRect)frame
                       action:(SEL)action {
  CGFloat fontSize = frame.size.height - frame.size.height * 0.3;
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  [btn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
  [btn setTitle:title forState:UIControlStateNormal];
  [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
  btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
  [btn addTarget:self
                action:action
      forControlEvents:UIControlEventTouchUpInside];
  return btn;
}
/**
 *  减号按钮点击
 *
 *  @param sender 减号按钮
 */
- (void)less:(UIButton *)sender {
  _plusBtn.enabled = YES;
  NSUInteger num = [_numLabel.text integerValue];
  --num;
  _numLabel.text = [NSString stringWithFormat:@"%zd", num];
  if (num <= 1) {
    sender.enabled = NO;
    return;
  }
}
/**
 *  加号按钮点击
 *
 *  @param sender 加号按钮
 */
- (void)plus:(UIButton *)sender {
  _lessBtn.enabled = YES;
  NSUInteger num = [_numLabel.text integerValue];
  ++num;
  _numLabel.text = [NSString stringWithFormat:@"%zd", num];
  if (num >= self.maxNum) {
    sender.enabled = NO;
    return;
  }
}
/**
 *  能加到的最大数字[默认5]
 *
 *  @return 能加到的最大数字
 */
- (NSUInteger)maxNum {
  if (_maxNum == 0) {
    _maxNum = 5;
  }
  return _maxNum;
}
/**
 *  获取当前显示的数字
 *
 *  @return 当前显示的数字
 */
- (NSUInteger)currentNum {
  return [_numLabel.text integerValue];
}
/**
 *  显示的颜色样式
 */
- (void)setColorStyle:(UIColor *)colorStyle {
  _colorStyle = colorStyle;
  [_lessBtn setTitleColor:colorStyle forState:UIControlStateNormal];
  [_plusBtn setTitleColor:colorStyle forState:UIControlStateNormal];
  self.layer.borderColor = [colorStyle CGColor];
}
@end
