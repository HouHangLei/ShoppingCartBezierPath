# 加入购物车动画效果


## 使用方法
1.导入头文件 
```
#import "AddShoppingCartAnimationTool.h"
```

2.调用startAnimationand...方法
```
    [[AddShoppingCartAnimationTool shareTool] startAnimationandFromView:self.addShoppingCart toView:self.shoppingCartBtn imgView:self.imgView];

```

```
/**
 开始动画

 @param fromView 开始view（加入购物车按钮）
 @param toView 结束view（购物车view）
 @param imgView 商品图片view
 */
- (void)startAnimationandFromView:(UIView *)fromView toView:(UIView *)toView imgView:(UIView *)imgView;
```

## 效果
![myGif.gif](http://upload-images.jianshu.io/upload_images/3643442-f0372eba99453eb7.gif?imageMogr2/auto-orient/strip)
