//
//  ViewController.m
//  FirstView
//
//  Created by 一米阳光 on 16/12/30.
//  Copyright © 2016年 一米阳光. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createFirstView];
    [self coverView];
    [self insertAboveView];
    [self insertBelowView];
    [self exchangeSubview];
    [self bringToFrontView];
    [self sendToBackView];
    [self removeView];
    [self setAlpha];
    
}

/**
 *  在视图A上加载视图B,那么视图B就是视图A的子视图,视图A就是视图B的父视图
 *  父视图可以有很多子视图,但是子视图只能有一个父视图
 */
- (void)createFirstView {
    /**
     *  获取某视图的宽度:CGRectGetWidth(view.frame)
     *  获取某视图的高度:CGRectGetHeight(view.frame)
     *  获取某视图的起始X坐标:CGRectGetMinX(view.frame)
     *  获取某视图的起始Y坐标:CGRectGetMinY(view.frame)
     */
    CGFloat left = 20;
    CGFloat top = 30;
    CGFloat width = CGRectGetWidth(self.view.bounds)-2*left;
    CGFloat height = 50;

    UIView * view1 = [[UIView alloc] init];
    view1.frame = CGRectMake(left, top, width, height);
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
}

/**
 *  后添加的子视图,显示在最上面
 *  多个子视图的frame如果有重合部分,我们不能通过视觉效果判断谁是谁的父视图,必须通过superview方法来判断父视图
 */
- (void)coverView {
    CGFloat left = 20;
    CGFloat top = 100;
    CGFloat width = CGRectGetWidth(self.view.bounds)-2*left;
    CGFloat height = 50;

    UIView * view1 = [[UIView alloc] init];
    view1.frame = CGRectMake(left, top, width, height);
    view1.backgroundColor = [UIColor redColor];
    view1.tag = 101;
    [self.view addSubview:view1];
    
    UIView * view2 = [[UIView alloc] initWithFrame:CGRectMake(left, top, width, height)];
    view2.backgroundColor = [UIColor blueColor];
    view2.tag = 102;
    [self.view addSubview:view2];
    
    UIView * superView1 = view1.superview;
    UIView * superView2 = view2.superview;
    if (superView1 == superView2) {
        NSLog(@"view1和view2是同一个父视图");
    }
}

//在某个子视图上面插入一个子视图
- (void)insertAboveView {
    CGFloat left = 20;
    CGFloat top = 170;
    CGFloat width = CGRectGetWidth(self.view.bounds)-2*left;
    CGFloat height = 50;
    
    UIView * view1 = [[UIView alloc] init];
    view1.frame = CGRectMake(left, top, width, height);
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    top = top+20;
    UIView * view2 = [[UIView alloc] initWithFrame:CGRectMake(left, top, width, height)];
    view2.backgroundColor = [UIColor yellowColor];
    [self.view insertSubview:view2 aboveSubview:view1];
}

 //在某个子视图下面插入一个子视图
- (void)insertBelowView {
    CGFloat left = 20;
    CGFloat top = 260;
    CGFloat width = CGRectGetWidth(self.view.bounds)-2*left;
    CGFloat height = 50;
    
    UIView * view1 = [[UIView alloc] init];
    view1.frame = CGRectMake(left, top, width, height);
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    top = top+20;
    UIView * view2 = [[UIView alloc] initWithFrame:CGRectMake(left, top, width, height)];
    view2.backgroundColor = [UIColor greenColor];
    [self.view insertSubview:view2 belowSubview:view1];
}

//交换两个子视图在父视图上的位置
- (void)exchangeSubview {
    CGFloat left = 20;
    CGFloat top = 340;
    CGFloat width = CGRectGetWidth(self.view.bounds)-2*left;
    CGFloat height = 50;
    
    UIView * view1 = [[UIView alloc] init];
    view1.frame = CGRectMake(left, top, width, height);
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    top = top+20;
    UIView * view2 = [[UIView alloc] initWithFrame:CGRectMake(left, top, width, height)];
    view2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view2];
    
    NSArray *subviews = [self.view subviews];
    NSInteger index1 = [subviews indexOfObject:view1];
    NSInteger index2 = [subviews indexOfObject:view2];
    [self.view exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
}

//将某个子视图提到所有子视图的最前面
- (void)bringToFrontView {
    CGFloat left = 20;
    CGFloat top = 340;
    CGFloat width = CGRectGetWidth(self.view.bounds)-2*left;
    CGFloat height = 50;
    
    UIView * view1 = [[UIView alloc] init];
    view1.frame = CGRectMake(left, top, width, height);
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    top = top+20;
    UIView * view2 = [[UIView alloc] initWithFrame:CGRectMake(left, top, width, height)];
    view2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view2];
    
    top = top+20;
    UIView * view3 = [[UIView alloc] initWithFrame:CGRectMake(left, top, width, height)];
    view3.backgroundColor = [UIColor brownColor];
    [self.view addSubview:view3];
    [self.view bringSubviewToFront:view2];
}

//将某个子视图扔到所有子视图的最后面
- (void)sendToBackView {
    CGFloat left = 20;
    CGFloat top = 460;
    CGFloat width = CGRectGetWidth(self.view.bounds)-2*left;
    CGFloat height = 50;
    
    UIView * view1 = [[UIView alloc] init];
    view1.frame = CGRectMake(left, top, width, height);
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    top = top+20;
    UIView * view2 = [[UIView alloc] initWithFrame:CGRectMake(left, top, width, height)];
    view2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view2];
    
    top = top+20;
    UIView * view3 = [[UIView alloc] initWithFrame:CGRectMake(left, top, width, height)];
    view3.backgroundColor = [UIColor brownColor];
    [self.view addSubview:view3];
    [self.view sendSubviewToBack:view2];
}

//从父视图上移除某个子视图
- (void)removeView {
    CGFloat left = 20;
    CGFloat top = 560;
    CGFloat width = CGRectGetWidth(self.view.bounds)-2*left;
    CGFloat height = 50;
    
    UIView * view1 = [[UIView alloc] init];
    view1.frame = CGRectMake(left, top, width, height);
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    [view1 removeFromSuperview];
}

//设置视图透明度
- (void)setAlpha {
    CGFloat left = 20;
    CGFloat top = 615;
    CGFloat width = CGRectGetWidth(self.view.bounds)-2*left;
    CGFloat height = 50;
    
    UIView * view1 = [[UIView alloc] init];
    view1.frame = CGRectMake(left, top, width, height);
    view1.alpha = 0.5;
    view1.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view1];
}

@end
