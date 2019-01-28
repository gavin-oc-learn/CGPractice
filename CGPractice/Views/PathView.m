//
//  PathView.m
//  CGPractice
//
//  Created by liu kai on 2018/11/29.
//  Copyright © 2018 liu kai. All rights reserved.
//

#import "PathView.h"
#import "masonry.h"

@implementation PathView

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
    LineView *view = [[LineView alloc] initWithFrame:CGRectZero];
    [self addSubview:view];
//    view.backgroundColor = <#[UIColor whiteColor]#>;
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.top.mas_equalTo(0);
        make.height.mas_equalTo(200.0f);
    }];
    
    MultipleLineView *multipleLineView =  [[MultipleLineView alloc] initWithFrame:CGRectZero];
    [self addSubview: multipleLineView];
    [multipleLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(0);
        make.top.equalTo(view.mas_bottom).mas_equalTo(20.0f);
        make.height.mas_equalTo(200.0f);
    }];
    
    PolygonView *polygonView = [[PolygonView alloc] initWithFrame:CGRectZero];
    [self addSubview:polygonView];
    [polygonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(0);
        make.height.mas_equalTo(100);
        make.top.equalTo(multipleLineView.mas_bottom).mas_equalTo(20);
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

@implementation LineView

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    CGContextSaveGState(ctx);
//    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
//    CGContextFillRect(ctx, self.bounds);
//    CGContextSetLineDash(ctx, 3, 8, <#size_t count#>);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
//    CGFloat lengths[] = {10,5};
    CGFloat lengths[] = {6, 9};
    CGContextSetLineDash(ctx, 2.0f, lengths, 2);
    CGContextSetLineWidth(ctx, 3.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextMoveToPoint(ctx, 10.0f, 10.0f);
    CGContextAddLineToPoint(ctx, 10.0f, 200.0f);
    CGContextStrokePath(ctx);
//    CGcontextcolor
    CGContextRestoreGState(ctx);
    
   
}

@end

@implementation MultipleLineView

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    CGContextSaveGState(ctx);
    CGContextMoveToPoint(ctx, 10.0f, 0.0f);
    CGContextAddLineToPoint(ctx, 20.0f, 200.0f);
    [[UIColor yellowColor] setStroke];
    CGContextStrokePath(ctx);
    CGContextRestoreGState(ctx);
    
    CGContextSaveGState(ctx);
    
    [[UIColor redColor] setStroke];
    CGContextMoveToPoint(ctx, 20.0f, 0.0f);
    CGContextAddCurveToPoint(ctx, 120, 140, 150, 200, 180, 150);
    [[UIColor redColor] setStroke];
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
//    CGContextStrokePath(ctx);
    CGContextClosePath(ctx);
    CGContextDrawPath(ctx, kCGPathFillStroke); //根据坐标绘制路径
    CGContextRestoreGState(ctx);
    
    
    CGContextSaveGState(ctx);
    [[UIColor redColor] setStroke];
    CGContextMoveToPoint(ctx, 200.0f, 0.0f);
    CGContextAddQuadCurveToPoint(ctx, 220, 140, 280, 150);
    [[UIColor redColor] setStroke];
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    //    CGContextStrokePath(ctx);
    CGContextClosePath(ctx);
    CGContextDrawPath(ctx, kCGPathFillStroke); //根据坐标绘制路径
    CGContextRestoreGState(ctx);

}

@end


@implementation PolygonView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //triangle view
    CGContextSaveGState(ctx);
    CGPoint points[3];
    points[0] = CGPointMake(20.0f, 20.0f);
    points[1] = CGPointMake(20.0f, 80.0f);
    points[2] = CGPointMake(50.0f, 50.0f);
    CGContextAddLines(ctx, points, 3);
    CGContextClosePath(ctx);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    CGContextRestoreGState(ctx);
    
    //add rect
    CGContextSaveGState(ctx);
    CGContextAddRect(ctx, CGRectMake(60.0f, 0.0f, 80.0f, 80.0f));
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    CGContextRestoreGState(ctx);
    
    //add ellipse
    CGContextSaveGState(ctx);
    CGContextAddEllipseInRect(ctx, CGRectMake(160.0f, 0.0f, 80.0f, 60.0f));
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    CGContextRestoreGState(ctx);
    
    //add arc
    CGContextSaveGState(ctx);
    CGContextMoveToPoint(ctx, 300.0f, 40.0f);
    CGContextAddArcToPoint(ctx, 300.0f, 60.0f, 280.0f, 60.0f, 10);
    CGContextAddArcToPoint(ctx, 260.0f, 60.0f, 260.0f, 40.0f, 10);
    CGContextAddArcToPoint(ctx, 260.0f, 10.0f, 280.0f, 10.0f, 10);
    CGContextAddArcToPoint(ctx, 300.0f, 10.0f, 300.0f, 20.0f, 10);
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextClosePath(ctx);
    CGContextDrawPath(ctx, kCGPathFillStroke);
//    CGContextAddArc(ctx, 260.0f, 0.0f, CGFloat radius, CGFloat startAngle, CGFloat endAngle, <#int clockwise#>)
}

@end
