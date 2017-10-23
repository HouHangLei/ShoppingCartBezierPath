//
//  AddShoppingCartAnimationTool.m
//  ShoppingCartBezierPath
//
//  Created by weizhongming on 2017/10/23.
//  Copyright © 2017年 PECOO. All rights reserved.
//

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "AddShoppingCartAnimationTool.h"

@implementation AddShoppingCartAnimationTool

static AddShoppingCartAnimationTool *_tool = nil;

+(instancetype)shareTool
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _tool = [[AddShoppingCartAnimationTool alloc]init];
    });
    return _tool;
}

- (void)startAnimationandFromView:(UIView *)fromView toView:(UIView *)toView imgView:(UIView *)imgView{
    
    self.shoppingCartView = toView;
    
    _layer = [CALayer layer];
    _layer.contents = imgView.layer.contents;
    _layer.contentsGravity = kCAGravityResizeAspectFill;
    _layer.bounds = CGRectMake(CGRectGetMinX(fromView.frame) +30, CGRectGetMinY(fromView.frame), 40, 40);
    //    _layer.backgroundColor = [UIColor redColor].CGColor;
    [[UIApplication sharedApplication].keyWindow.layer addSublayer:_layer];
    
    //    获取fromView在self.view上的位置
    CGRect fromViewRect = [fromView convertRect:fromView.bounds toView:[UIApplication sharedApplication].keyWindow.rootViewController.view];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    //    初始点fromView的中心
    [path moveToPoint:CGPointMake(fromViewRect.origin.x +fromViewRect.size.width /2, fromViewRect.origin.y +fromViewRect.size.height /2)];
    
    //    获取toView在self.view上的位置
    CGRect toViewRect = [toView convertRect:toView.bounds toView:[UIApplication sharedApplication].keyWindow.rootViewController.view];
    
    //    增加一条曲线（终点是toView的）
    [path addCurveToPoint:CGPointMake(toViewRect.origin.x +toViewRect.size.width /2, toViewRect.origin.y +toViewRect.size.height /2) controlPoint1:CGPointMake(CGRectGetMinX(fromView.frame) +5, SCREEN_HEIGHT -CGRectGetHeight(fromView.frame) -100) controlPoint2:CGPointMake(CGRectGetMinX(fromView.frame) -5, SCREEN_HEIGHT -CGRectGetHeight(fromView.frame) -100)];
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.path = path.CGPath;
    
    //    缩小动画
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.removedOnCompletion = NO;
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.5];
    
    //    执行
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[pathAnimation,scaleAnimation];
    groups.duration = 0.5f;
    groups.removedOnCompletion=NO;
    groups.fillMode=kCAFillModeForwards;
    groups.delegate = self;
    [_layer addAnimation:groups forKey:@"group"];
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (anim == [_layer animationForKey:@"group"]) {
        
        //        执行完成remove掉layer
        [_layer removeFromSuperlayer];
        _layer = nil;
        
        //        购物车按钮跳动动画
        CABasicAnimation *shakeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
        shakeAnimation.duration = 0.25f;
        shakeAnimation.fromValue = [NSNumber numberWithFloat:-5];
        shakeAnimation.toValue = [NSNumber numberWithFloat:5];
        shakeAnimation.autoreverses = YES;
        [self.shoppingCartView.layer addAnimation:shakeAnimation forKey:nil];
        
    }
}

@end

