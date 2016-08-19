//
//  ViewController.m
//  IRPlusLess
//
//  Created by zhongdai on 16/8/18.
//  Copyright © 2016年 irena. All rights reserved.
//

#import "IRPlusLessView.h"
#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, weak) IRPlusLessView *plusLessView;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  IRPlusLessView *plusLessView =
      [[IRPlusLessView alloc] initWithFrame:CGRectMake(100, 100, 150, 50)];
  _plusLessView = plusLessView;
  plusLessView.maxNum = 3;
  plusLessView.colorStyle = [UIColor greenColor];
  [self.view addSubview:plusLessView];
}
/**
 *  获取当前显示数字
 */
- (IBAction)getCurrentNum:(id)sender {
  NSLog(@"%zd", _plusLessView.currentNum);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
