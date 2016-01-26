//
//  DDTabBarController.m
//  MessageNumDemo
//
//  Created by 张小冬 on 16/1/25.
//  Copyright © 2016年 dadong. All rights reserved.
//

#import "DDTabBarController.h"
#import "DDCustomButton.h"
#import "ViewController.h"
#undef DD_SCREEN_WIDTH
#define DD_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width) //宽


//tabbar的高
#define tabbar_height 49.0
static void *ID = @"DDTabBarController";
@interface DDTabBarController ()
@property (nonatomic, strong)UIView *myTabBar ;

@property (nonatomic, weak)UIButton * selectedButton ;

@property (nonatomic, strong)NSMutableArray *buttons ;
@end

@implementation DDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for ( UIView *view in self.tabBar.subviews) {
        [view removeFromSuperview];
    }
    //移除之后才可以增加到bar上
    [self.tabBar addSubview:_myTabBar];
}

- (void)initView
{
    _myTabBar = [[UIView alloc]initWithFrame:self.tabBar.bounds];
    _myTabBar.backgroundColor = [UIColor grayColor];                      //tabbar的颜色
    
    
    ViewController *vc1 = [[ViewController alloc]init];
    [self setupTabBarItemWithController:vc1 title:@"首页" imageName:@"tab_bar_cart"];
    
    UIViewController *vc2 = [[UIViewController alloc]init];
    [self setupTabBarItemWithController:vc2 title:@"首页2" imageName:@"tab_bar_category"];
    
    
//    //title未选中的颜色
//    [[UITabBarItem appearance] setTitleTextAttributes:@{
//                                                        NSForegroundColorAttributeName:[UIColor blackColor]
//                                                        }forState:UIControlStateNormal];
//    //title选中的颜色
//    [[UITabBarItem appearance] setTitleTextAttributes:@{
//                                                        NSForegroundColorAttributeName:[UIColor orangeColor]
//                                                        }forState:UIControlStateSelected];
}

-(void) setupTabBarItemWithController:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    DDCustomButton *button = [[DDCustomButton alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateSelected];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentCenter ;
    button.titleLabel.font = [UIFont systemFontOfSize:12];//设置字体
    button.tag = self.childViewControllers.count ;
    [button addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    nav.title = title ; //设置导航栏标题
    
    
    [self addChildViewController:nav];
    [self.myTabBar addSubview:button];
    [self.buttons addObject:button];
    [self relayoutSubviews];
    [nav.tabBarItem addObserver:self forKeyPath:@"badgeValue" options:1 context:ID];
}
-(void) setupTabBarItemWithController:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName
{
    [self setupTabBarItemWithController:vc title:title imageName:imageName selectedImageName:[NSString stringWithFormat:@"%@_selected",imageName]];
}

/**
 *  选中其他按钮，即切换控制器
 *
 */
- (void) selectedBtn:(UIButton *)button
{
    _selectedButton.selected = NO ;
    _selectedButton = button ;
    button.selected = YES ;
    self.selectedIndex = button.tag ;  //设置当前选中的控制器！！！！
}


- (NSMutableArray *)buttons
{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons ;
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


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([@"badgeValue" isEqualToString:keyPath]) {
        NSString *value =  change[@"new"];
        NSInteger i = [self.tabBar.items indexOfObject:object];
        DDCustomButton *button = _buttons[i] ;
        button.badgeValue = value ;
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
@end
