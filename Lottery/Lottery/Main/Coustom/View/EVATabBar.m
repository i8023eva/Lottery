//
//  EVATabBar.m
//  Lottery
//
//  Created by lyh on 15/11/8.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "EVATabBar.h"
#import "EVATabBarButton.h"

@interface EVATabBar ()

@property (nonatomic, weak) UIButton *selectedButton;
@end

@implementation EVATabBar


- (void)addTabBarButtonWithImageName:(NSString *)name selImageName:(NSString *)selName {
        EVATabBarButton *btn = [EVATabBarButton buttonWithType:UIButtonTypeCustom];

        // 设置按钮的图片
        [btn setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        
        [btn setBackgroundImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
        
        // 监听按钮的点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:btn];
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void) setupSubView {
    NSString *imageName = nil;
    
    NSString *selImageName = nil;
    
    for (int i = 0; i < 5; i++) {
        EVATabBarButton *btn = [EVATabBarButton buttonWithType:UIButtonTypeCustom];
        // 绑定角标
        btn.tag = i;
        
        imageName = [NSString stringWithFormat:@"TabBar%d",i + 1];
        selImageName = [NSString stringWithFormat:@"TabBar%dSel",i + 1];
        
        // 设置按钮的图片
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        
        [btn setBackgroundImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
        
        // 监听按钮的点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:btn];
        
        // 默认选中第一个按钮
        if (i == 0) {
            [self btnClick:btn];
        }
    }
}

// 点击按钮的时候调用
- (void)btnClick:(UIButton *)button
{
    // 取消之前选择按钮
    _selectedButton.selected = NO;
    // 选中当前按钮
    button.selected = YES;
    // 记录当前选中按钮
    _selectedButton = button;
    
    if (_block) {
        self.block(button.tag);
    }
    
    // 切换控制器
//    if ([_delegate respondsToSelector:@selector(tabBar:didSelectedIndex:)]) {
//        [_delegate tabBar:self didSelectedIndex:button.tag];
//    }
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat btnW = self.bounds.size.width / self.subviews.count;
    CGFloat btnH = self.bounds.size.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    // 设置按钮的尺寸
    for (int i = 0; i < self.subviews.count; i++) {
        UIButton *btn = self.subviews[i];
        
        btn.tag = i;
        
        btnX = i * btnW;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        // 默认选中第一个按钮
        if (i == 0) {
            [self btnClick:btn];
        }
    }
}


@end
