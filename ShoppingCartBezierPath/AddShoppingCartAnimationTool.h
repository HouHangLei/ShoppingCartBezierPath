//
//  AddShoppingCartAnimationTool.h
//  ShoppingCartBezierPath
//
//  Created by weizhongming on 2017/10/23.
//  Copyright © 2017年 PECOO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AddShoppingCartAnimationTool : NSObject <CAAnimationDelegate>

@property (nonatomic, strong) CALayer *layer;

/**
 购物车view
 */
@property (nonatomic, strong) UIView *shoppingCartView;

+(instancetype)shareTool;

/**
 开始动画

 @param fromView 开始view（加入购物车按钮）
 @param toView 结束view（购物车view）
 @param imgView 商品图片view
 */
- (void)startAnimationandFromView:(UIView *)fromView toView:(UIView *)toView imgView:(UIView *)imgView;

@end
