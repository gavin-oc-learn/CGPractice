//
//  RectangleView.m
//  CGPractice
//
//  Created by liu kai on 2018/11/28.
//  Copyright © 2018 liu kai. All rights reserved.
//

#import "RectangleView.h"
#import "Masonry.h"
#import "Colours.h"

@class FillView;
@interface RectangleView()

@end

@implementation RectangleView

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
    FillView *view = [[FillView alloc] initWithFrame:CGRectZero];
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.top.mas_equalTo(0.0f);
        make.height.mas_equalTo(30.0f);
    }];
    
    GradientView *gradientView = [[GradientView alloc] initWithFrame:CGRectZero];
    [self addSubview:gradientView];
    [gradientView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_offset(0.0f);
        make.height.mas_offset(60.0f);
        make.top.equalTo(view.mas_bottom).offset(30.0f);
    }];
    
    StrokeView *strokeView = [[StrokeView alloc] initWithFrame:CGRectZero];
    [self addSubview:strokeView];
    [strokeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_offset(0.0f);
        make.height.mas_offset(100.0f);
        make.top.equalTo(gradientView.mas_bottom).offset(30.0f);
    }];
    
    BeginContextView *contextView = [[BeginContextView alloc] initWithFrame:CGRectZero];
    [self addSubview:contextView];
    [contextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_offset(0.0f);
        make.height.mas_offset(200.0f);
        make.bottom.mas_equalTo(30.0f);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"a good news");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@implementation FillView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *color = [UIColor greenColor];
//    CGcontextcolo(context, color.CGColor);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, self.bounds);
    
}

@end

@implementation GradientView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextFillRect(context, self.bounds);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0.0f, 1.0f};
//    CGColorRef startColor = [UIColor colorFromHexString:@"#f33200"].CGColor;
    CGColorRef startColor = [UIColor blackColor].CGColor;
    CGColorRef endColor = [UIColor whiteColor].CGColor;
//    CGColorRef endColor = [UIColor colorFromHexString:@"#f95a00"].CGColor;
    NSArray *color = @[(__bridge id)startColor, (__bridge id)endColor];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)color, locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect));
    
//    CGContextSaveGState(context);
    CGContextAddRect(context, CGRectMake(10.0f, 10.0f, CGRectGetWidth(rect) - 20.0f, CGRectGetHeight(rect) - 20.0f));
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
//    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

@end


@implementation StrokeView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    self.backgroundColor = [UIColor whiteColor];

    CGContextRef ctx= UIGraphicsGetCurrentContext();
    
    [[UIColor redColor] setStroke];
    CGContextSaveGState(ctx);
    [[UIColor yellowColor] setStroke];
    CGContextRestoreGState(ctx);
    CGContextAddRect(ctx, CGRectMake(0, 0, 50, 50));
    CGContextStrokePath(ctx);
    
    CGContextAddEllipseInRect(ctx, CGRectMake(80.0f, 0.0f, 50.0f, 20.0f));
    [[UIColor greenColor] setStroke];
    CGContextSetLineWidth(ctx, 3.0f);
//    CGContextDrawPath(<#CGContextRef  _Nullable c#>, <#CGPathDrawingMode mode#>)
    CGContextStrokePath(ctx);
    
    CGContextAddArc(ctx, 160.0f, 50.0f, 30.0f, M_PI_4, M_PI, 1);
    CGContextStrokePath(ctx);
    
}

@end

@implementation BeginContextView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
//    UIGraphicsBeginImageContext(self.bounds.size);
//    CGContextRef newContext = UIGraphicsGetCurrentContext();
////    CGContextAddRect(newContext, CGRectMake(0, 0, 100.0f, 100.0f));
////    CGContextAddRect(CGContextRef  _Nullable c, <#CGRect rect#>)
//    CGContextSetFillColorWithColor(newContext, [UIColor redColor].CGColor);
////    CGContextFillPath(newContext);
//    CGContextFillRect(newContext, CGRectMake(0, 0, 100.0f, 100.0f));
//    UIGraphicsEndImageContext();
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//
//    CGRect drawRect = CGRectMake(rect.origin.x, rect.origin.y,rect.size.width, rect.size.height);
//
//    CGContextSetRGBFillColor(context, 100.0f/255.0f, 100.0f/255.0f, 100.0f/255.0f, 1.0f);
//    CGContextFillRect(context, drawRect);
    
//    UIGraphicsBeginImageContext(CGSizeMake(100.0f, 100.0f));
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextFillRect(ctx, CGRectMake(0, 0, 100.0f, 100.0f));
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    CGContextDrawImage(ctx,  CGRectMake(0, 0, 100.0f, 100.0f), image.CGImage);
    
}

@end
