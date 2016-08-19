//
//  IRPlusLess.h
//  IRPlusLess
//
//  Created by zhongdai on 16/8/18.
//  Copyright © 2016年 irena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IRPlusLessView : UIView
/**
 *  能加到最大的数值
 */
@property(nonatomic, assign) NSUInteger maxNum;
/**
 *  当前显示的数字
 */
@property(nonatomic, assign) NSUInteger currentNum;
/**
 *  显示的颜色样式
 */
@property(nonatomic, copy) UIColor* colorStyle;
@end
