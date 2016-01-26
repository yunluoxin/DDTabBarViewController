//
//  MessageNumView.m
//  MessageNumDemo
//
//  Created by 张小冬 on 16/1/25.
//  Copyright © 2016年 dadong. All rights reserved.
//

#import "MessageNumView.h"
#import "NSString+DD.h"

#undef MessageNumImage
#define MessageNumImage ([UIImage imageNamed:@"message_num"])

@implementation MessageNumView
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initView];
    }
    return self ;
}
- (instancetype)init
{
    if (self = [super init]) {
        [self initView];
    }
    return self ;
}
- (void)initView
{
    self.hidden = YES ;//默认隐藏
    self.userInteractionEnabled = NO ;
    self.backgroundColor = [UIColor clearColor];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:9];
    self.titleLabel.textAlignment = NSTextAlignmentCenter ;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self ;
}
- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = badgeValue ;
    if ([NSString isBlank:badgeValue]) {
        //为空则隐藏
        self.hidden = YES ;
        return ;
    }
    self.hidden = NO ;
    CGFloat width = MessageNumImage.size.width ;
    CGFloat height = MessageNumImage.size.height ;
    if (badgeValue.length == 1) {
        //不拉伸
        [self setBackgroundImage:MessageNumImage forState:UIControlStateNormal];
        [self setTitle:badgeValue forState:UIControlStateNormal];
        self.bounds = CGRectMake(0, 0, width, height);
        return ;
    }
    if (![badgeValue isEqualToString:@"new"] && ![badgeValue isEqualToString:@"more"] && badgeValue.length > 2) {
        badgeValue = @"99+";
    }
    //    NSLog(@"%f---%f",MessageNumImage.size.width,MessageNumImage.size.height);
    CGSize size = [badgeValue sizeOfFont:self.titleLabel.font maxWidth:width * 3 maxHeight:height];
    self.bounds = CGRectMake(0, 0, size.width + width/2, height);
    [self setBackgroundImage:[MessageNumImage stretchableImageWithLeftCapWidth:width/2 topCapHeight:height/2] forState:UIControlStateNormal];
    [self setTitle:badgeValue forState:UIControlStateNormal];
    
}

@end
