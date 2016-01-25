//
//  DDCustomButton.m
//  卡车妈妈
//
//  Created by 张小冬 on 15/12/19.
//  Copyright © 2015年 张小东. All rights reserved.
//

#import "DDCustomButton.h"
#import "MessageNumView.h"
#undef DDButonInnerScale
#define DDButonInnerScale 0.7 ;
@interface DDCustomButton()
@property (nonatomic, weak) MessageNumView *messageNumView ;
@end
@implementation DDCustomButton
- (instancetype)init{
    self = [super init];
    if (self) {
        MessageNumView *messageNumView = [[MessageNumView alloc]init];
        self.messageNumView = messageNumView ;
        self.imageView.contentMode = UIViewContentModeCenter ;
        self.titleLabel.textAlignment = NSTextAlignmentCenter ;
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.adjustsImageWhenHighlighted = NO ;
        [self addSubview:messageNumView];
    }
    return self ;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleX = 0 ;
    CGFloat titleY = contentRect.size.height * DDButonInnerScale ;
    CGFloat titleW = contentRect.size.width ;
    CGFloat titleH = contentRect.size.height - contentRect.size.height * DDButonInnerScale ;
    return CGRectMake(titleX, titleY, titleW, titleH);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageX = 0 ;
    CGFloat imageY = 0 ;
    CGFloat imageW = contentRect.size.width ;
    CGFloat imageH = contentRect.size.height * DDButonInnerScale ;
    return CGRectMake(imageX, imageY, imageW, imageH);
}
- (void)setBadgeValue:(NSString *)badgeValue{
    if ([@"0" isEqualToString:badgeValue]) {
        badgeValue = nil ;
    }
    _badgeValue = badgeValue ;
    _messageNumView.badgeValue = badgeValue ;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat w = _messageNumView.bounds.size.width ;
    CGFloat h = _messageNumView.bounds.size.height ;
    CGFloat x = self.bounds.size.width - w - 20 ;
    CGFloat y = 3 ;
    _messageNumView.frame = CGRectMake(x,y,w,h);
}
@end