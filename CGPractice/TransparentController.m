//
//  TransparentController.m
//  CGPractice
//
//  Created by liu kai on 2018/11/30.
//  Copyright © 2018 liu kai. All rights reserved.
//

#import "TransparentController.h"

@interface TransparentController ()

@property (weak, nonatomic) IBOutlet UIView *magicView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation TransparentController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.magicView.layer.delegate = self;
    
//    [self.magicView.layer display];
    
//    UIGraphicsBeginImageContext(self.magicView.bounds.size);
//    [self.magicView.layer renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage *snapShotImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    self.imageView.image = snapShotImage;
    
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
