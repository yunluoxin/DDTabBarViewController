//
//  NSString+DD.h
//  卡车妈妈
//
//  Created by 张小冬 on 15/12/22.
//  Copyright © 2015年 张小东. All rights reserved.
//
//定义系统版本
#undef IOS_7_OR_LATER
#define IOS_7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0 ? YES : NO)
#undef IOS_9_OR_LATER
#define IOS_9_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >=9.0 ? YES : NO)
#import <UIKit/UIKit.h>

@interface NSString (DD)
/**
 *  验证字符串是否为空
 *  " "都为空
 *
 *  @return 空为真，不为空则返回假
 */
- (BOOL) isBlank ;
/**
 *  验证字符串是否为空(新增这个方法主要为了解决，上一个对象方法，当对象为nil无法调用的问题)
 *  nil," "都为空
 *  @return 空为真，不为空则返回假
 */
+ (BOOL) isBlank:(NSString *)str ;
/**
 *  验证手机号码是否合法
 *
 *  @return 通过返回YES，失败返回NO
 */

- (BOOL) validPhone ;
/**
 *  验证邮箱是否合法
 *
 *  @return 通过返回YES，失败返回NO
 */
- (BOOL) validMail ;
/**
 *  计算一个自定义字符串的大小
 *
 *  @param font       字体
 *  @param max_width  最大宽度
 *  @param max_height 最大高度
 *
 *  @return 计算出的大小
 */
- (CGSize)sizeOfFont:(UIFont *)font maxWidth:(CGFloat)max_width maxHeight:(CGFloat)max_height;
@end
