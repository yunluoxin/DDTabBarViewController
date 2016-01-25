//
//  NSString+DD.m
//  卡车妈妈
//
//  Created by 张小冬 on 15/12/22.
//  Copyright © 2015年 张小东. All rights reserved.
//

#import "NSString+DD.h"
@implementation NSString (DD)
- (BOOL)isBlank
{
    if (!self||self.length==0) {
        return YES ;
    }
    BOOL flag = YES ;
    if (self.length >= 1) {
        for (int i = 0 ;i<self.length ;i++) {
            unichar c = [self characterAtIndex:i];
            if (!(c == ' ')) {
                flag = NO ;
                break;
            }
        }
    }
    return flag ;
}

+ (BOOL)isBlank:(NSString *)str
{
    if (!str) {
        return YES ;
    }
    if (![str isKindOfClass:[NSString class]]) {
        return YES ;
    }
    return [str isBlank];
    
}
- (BOOL)validPhone
{
    if ([self isBlank]) {
        return NO ;
    }
    if (!(self.length==11)) {
        return NO ;
    }
    //正则匹配
    NSString *reg = @"^1\\d{10}$";
    return YES ;
}
- (BOOL)validMail
{
    if ([self isBlank]) {
        return NO ;
    }
    NSString *reg = @"^.+@.+(.com)|(.cn)|(.com.cn)$";
    return YES ;
}

- (CGSize)sizeOfFont:(UIFont *)font maxWidth:(CGFloat)max_width maxHeight:(CGFloat)max_height
{
    if (IOS_7_OR_LATER) {
        //ios_7之后的
        NSDictionary *dic = @{
                              NSFontAttributeName:font,
                              NSForegroundColorAttributeName:[UIColor blackColor]
                              };
        return [self boundingRectWithSize:CGSizeMake(max_width, max_height) options:1 attributes:dic context:nil].size;
    }else{
        //ios_7之前的
        return [self sizeWithFont:font constrainedToSize:CGSizeMake(max_width, max_height) lineBreakMode:NSLineBreakByTruncatingTail];
    }
}

@end
