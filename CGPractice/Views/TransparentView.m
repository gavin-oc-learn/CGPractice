//
//  TransparentView.m
//  CGPractice
//
//  Created by liu kai on 2018/11/30.
//  Copyright © 2018 liu kai. All rights reserved.
//

#import "TransparentView.h"
#import "Masonry.h"

@implementation TransparentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    CommonView *commonView = [[CommonView alloc] initWithFrame:CGRectZero];
    [self addSubview:commonView];
//    view.backgroundColor = <#[UIColor whiteColor]#>;
    [commonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(50.0f);
    }];
    
    MainTransparentView *transparentView = [[MainTransparentView alloc] initWithFrame:CGRectZero];
    [self addSubview:transparentView];
    [transparentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(200.0f);
        make.top.equalTo(commonView.mas_bottom).mas_equalTo(10);
    }];
    
    TrasnsformView *trasnsformView = [[TrasnsformView alloc] initWithFrame:CGRectZero];
    [self addSubview:trasnsformView];
    [trasnsformView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(200.0f);
        make.top.equalTo(transparentView.mas_bottom).mas_equalTo(10);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@implementation CommonView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextFillRect(ctx, self.bounds);
    
    CGContextSetShadowWithColor(ctx, CGSizeMake(0, 2), 10.0, [UIColor blueColor].CGColor);
    
//    CGContextSaveGState(ctx);
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextFillRect(ctx, CGRectMake(0, 10, 50, 50));
//    CGContextRestoreGState(ctx);
    
//    CGContextSaveGState(ctx);
    CGContextSetFillColorWithColor(ctx, [UIColor greenColor].CGColor);
    CGContextFillRect(ctx, CGRectMake(30, 0, 50, 50));
//    CGContextRestoreGState(ctx);
}

@end

@implementation MainTransparentView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextFillRect(ctx, self.bounds);
    
    CGContextSetShadowWithColor(ctx, CGSizeMake(0, 0), 10, [UIColor redColor].CGColor);
    
    CGContextBeginTransparencyLayer(ctx, NULL);
    
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextFillRect(ctx, CGRectMake(0, 140, 60, 60));
    
    CGContextSetFillColorWithColor(ctx, [UIColor greenColor].CGColor);
    CGContextFillRect(ctx, CGRectMake(40, 100, 60, 60));
    
    CGContextSetFillColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextFillRect(ctx, CGRectMake(80, 60, 60, 60));
    
    CGContextEndTransparencyLayer(ctx);
    
}

@end

@implementation TrasnsformView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [UIColor greenColor].CGColor);
    CGContextFillRect(ctx, self.bounds);
    
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextTranslateCTM (ctx, 20, 0);
    CGContextRotateCTM(ctx, 45 * M_PI / 180);
    CGContextFillRect(ctx, CGRectMake(0, 0, 100, 100));
    
    
}

@end
