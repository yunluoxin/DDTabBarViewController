//
//  DDTabBar.h
//  MessageNumDemo
//
//  Created by 张小冬 on 16/1/25.
//  Copyright © 2016年 dadong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDTabBar : UITabBar
-(void) addViewController:(UIViewController *)vc withTitle:(NSString *)title normalImageName:(NSString *) imageName selectedImageName:(NSString *)selectedImageName ;
@end
