# IRPlusLessView
加减号控件

![要实现的效果](http://7xrirn.com1.z0.glb.clouddn.com/plusLess.gif) 

使用
--

```
  IRPlusLessView *plusLessView =
      [[IRPlusLessView alloc] initWithFrame:CGRectMake(100, 100, 150, 50)];
  _plusLessView = plusLessView;
  plusLessView.maxNum = 3;
  //  plusLessView.colorStyle = [UIColor greenColor];  
  [self.view addSubview:plusLessView];
  ```