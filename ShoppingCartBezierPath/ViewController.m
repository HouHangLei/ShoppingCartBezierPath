//
//  ViewController.m
//  ShoppingCartBezierPath
//
//  Created by weizhongming on 2017/10/23.
//  Copyright © 2017年 PECOO. All rights reserved.
//

#import "ViewController.h"
#import "AddShoppingCartAnimationTool.h"
@interface ViewController ()

@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) UIButton *shoppingCartBtn;

@property (nonatomic, strong) UIButton *addShoppingCart;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
    self.imgView.image = [UIImage imageNamed:@"商品图片.jpg"];
    [self.view addSubview:self.imgView];
    
    self.shoppingCartBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.shoppingCartBtn.frame = CGRectMake(self.view.frame.size.width -140, self.view.frame.size.height -40, 40, 40);
    [self.shoppingCartBtn setImage:[UIImage imageNamed:@"详情-购物车"] forState:UIControlStateNormal];
    [self.view addSubview:self.shoppingCartBtn];
    
    self.addShoppingCart = [UIButton buttonWithType:UIButtonTypeSystem];
    self.addShoppingCart.frame = CGRectMake(self.view.frame.size.width -100, CGRectGetMinY(self.shoppingCartBtn.frame), 100, 40);
    self.addShoppingCart.backgroundColor = [UIColor grayColor];
    [self.addShoppingCart setTitle:@"加入购物车" forState:UIControlStateNormal];
    [self.addShoppingCart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.addShoppingCart.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [self.addShoppingCart addTarget:self action:@selector(addShoppingCartClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addShoppingCart];
    
}

- (void)addShoppingCartClick{
    
    [[AddShoppingCartAnimationTool shareTool] startAnimationandFromView:self.addShoppingCart toView:self.shoppingCartBtn imgView:self.imgView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
