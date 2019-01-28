//
//  EffectView.m
//  CGPractice
//
//  Created by liu kai on 2018/11/29.
//  Copyright © 2018 liu kai. All rights reserved.
//

#import "EffectView.h"
#import "masonry.h"

@implementation EffectView

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
    ShadowView *shadowView = [[ShadowView alloc] initWithFrame:CGRectZero];
    [self addSubview:shadowView];
    shadowView.backgroundColor = [UIColor whiteColor];
    [shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.and.right.mas_equalTo(0);
        make.height.mas_equalTo(200);
    }];
    
    CustomImageView *imageView = [[CustomImageView alloc] initWithFrame:CGRectZero];
    [self addSubview:imageView];
//    imageView.backgroundColor = [UIColor redColor];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(0);
        make.left.and.right.mas_equalTo(0);
        make.top.equalTo(shadowView.mas_bottom).mas_offset(20.0f);
        make.height.mas_equalTo(160);
    }];
    
    MultipleGradientView *view = [[MultipleGradientView alloc] initWithFrame:CGRectZero];
    [self addSubview:view];
//    view.backgroundColor = <#[UIColor whiteColor]#>;
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(0);
        make.top.equalTo(imageView
                         .mas_bottom).mas_offset(20.0f);
        make.height.mas_equalTo(200);
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

@implementation ShadowView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor * whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
//    UIColor * shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    UIColor * shadowColor = [[UIColor redColor] colorWithAlphaComponent:1];
    
    CGContextSetFillColorWithColor(context, whiteColor.CGColor);
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 2), 100.0, shadowColor.CGColor);
//    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
//    CGContextFillRect(context, [UIColor blueColor].CGColor);
    CGContextFillRect(context, CGRectMake(10, 10, 100.0f, 100.0f));
    CGContextRestoreGState(context);
    
}

@end

@implementation CustomImageView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
   
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100.0f, 100.0f), NO, 0);
    [[UIColor redColor] setFill];
    UIRectFill(CGRectMake(0, 0, 100, 100));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [image drawInRect:CGRectMake(0, 0, 50, 50)];//在坐标中画出图片
//    [image dra]
    //    [image drawAtPoint:CGPointMake(100, 340)];//保持图片大小在point点开始画图片，可以把注释去掉看看
    CGContextDrawImage(ctx, CGRectMake(-100, 0, 20, 20), image.CGImage);
}

@end

@implementation MultipleGradientView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] = {
        1,1,1, 1.00,
        1,1,0, 1.00,
        1,0,0, 1.00,
        1,0,1, 1.00,
        0,1,1, 1.00,
        0,1,0, 1.00,
        0,0,1, 1.00,
        0,0,0, 1.00,
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));//形成梯形，渐变的效果
    CGColorSpaceRelease(rgb);
    
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 80, 0);
    CGContextAddLineToPoint(context, 80, 120);
    CGContextAddLineToPoint(context, 0, 120);
    CGContextClip(context);//context裁剪路径,后续操作的路径
    //CGContextDrawLinearGradient(CGContextRef context,CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint,CGGradientDrawingOptions options)
    //gradient渐变颜色,startPoint开始渐变的起始位置,endPoint结束坐标,options开始坐标之前or开始之后开始渐变
    CGContextDrawLinearGradient(context, gradient,CGPointMake
                                (20,0) ,CGPointMake(20,120),
                                kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);// 恢复到之前的context
    
    CGContextBeginTransparencyLayer(context, NULL);
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextFillRect(context, CGRectMake (0.0f, 0.0f, 200.0f, 200.0f));
    
    CGContextEndTransparencyLayer(context);
    NSLog(@"good case");
}

@end
