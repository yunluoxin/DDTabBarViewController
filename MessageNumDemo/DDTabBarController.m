//
//  DDTabBarController.m
//  MessageNumDemo
//
//  Created by 张小冬 on 16/1/25.
//  Copyright © 2016年 dadong. All rights reserved.
//

#import "DDTabBarController.h"
#import "DDCustomButton.h"
#undef DD_SCREEN_WIDTH
#define DD_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width) //宽


//tabbar的高
#define tabbar_height 49.0
static void *ID = @"DDTabBarController";
@interface DDTabBarController ()
@property (nonatomic, strong)UIView *myTabBar ;

@property (nonatomic, assign)NSInteger selectedIndex ;
@end

@implementation DDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%@",self.tabBar.subviews);
    for ( UIView *view in self.tabBar.subviews) {
        [view removeFromSuperview];
    }
    NSLog(@"%@",self.tabBar.subviews);
    //移除之后才可以增加到bar上
    [self.tabBar addSubview:_myTabBar];

}

- (void)initView
{
    _myTabBar = [[UIView alloc]initWithFrame:self.tabBar.bounds];
    _myTabBar.backgroundColor = [UIColor orangeColor];
    
    [self.tabBarItem addObserver:self forKeyPath:@"badgeValue" options:1 context:ID];
}

-(void) addViewController:(UIViewController *)vc withTitle:(NSString *)title normalImageName:(NSString *) imageName selectedImageName:(NSString *)selectedImageName
{
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    DDCustomButton *button = [[DDCustomButton alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateSelected];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentCenter ;
    button.titleLabel.font = [UIFont systemFontOfSize:12];//设置字体
    button.tag = self.childViewControllers.count ;
    [button addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addChildViewController:nav];
    [self.myTabBar addSubview:button];
    [self relayoutSubviews];
}

- (void) selectedButton:(DDCustomButton *)button
{
    NSLog(@"button.tag--%ld",button.tag);
    self.tabBarController.selectedViewController = self.childViewControllers[button.tag];
}

/**
 *  每增加一个选项就要重新布置一次
 */
-(void) relayoutSubviews
{
    NSInteger count = self.myTabBar.subviews.count;
    CGFloat margin = 3 ;
    CGFloat width = (DD_SCREEN_WIDTH - 2 *margin ) / count ;
//    CGFloat width = self.myTabBar.bounds.size.width / count ;
    for (int i = 0 ; i < count; i ++ ) {
        CGFloat x = margin + width * i ;
        UIView *view = self.myTabBar.subviews[i];
        view.frame = CGRectMake(x, 0, width, tabbar_height);
    }
}
@end
