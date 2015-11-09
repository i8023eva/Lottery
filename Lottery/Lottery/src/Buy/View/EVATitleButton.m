//
//  EVATitleButton.m
//  Lottery
//
//  Created by lyh on 15/11/9.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "EVATitleButton.h"

@implementation EVATitleButton

//图片不填充
-(void)awakeFromNib {
    self.imageView.contentMode = UIViewContentModeCenter;
}

// 不能使用self.titleLabel 因为self.titleLabel内部会调用titleRectForContentRect
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    NSDictionary *dict = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:15]
                           };
    CGFloat titleW = 0;
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) { // 判断运行时,及当前模拟器运行在哪个系统上
        
#ifdef __IPHONE_7_0 // 判断编译时 sdk7.0才允许编译
        titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil].size.width;
#else // sdk 6.0 编译下面
        titleW = [self.currentTitle sizeWithFont:[UIFont systemFontOfSize:15]].width;
        
#endif
    }else{
        titleW = [self.currentTitle sizeWithAttributes: @{NSFontAttributeName : [UIFont systemFontOfSize:15]}].width;
    }
    
    //contentRect 是当前的 bounds
    CGFloat titleH = contentRect.size.height;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 30;
    CGFloat imageH = contentRect.size.height;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageY = 0;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}

@end
