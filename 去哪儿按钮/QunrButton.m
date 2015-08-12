//
//  Qubutton.m
//  去哪儿按钮
//
//  Created by xxzx on 15/7/14.
//  Copyright (c) 2015年 hxyxt. All rights reserved.
//试试看git

#import "QunrButton.h"
#define cent_x self.bounds.size.width
#define cent_y self.bounds.size.height

@interface QunrButton ()

@property (nonatomic,strong)UIImageView *fingerprintView;//指纹view

@end
@implementation QunrButton
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



//重写get方法，懒加载
- (UIImageView *)fingerprintView
{
    if (!_fingerprintView) {
        _fingerprintView= [[UIImageView alloc]init];
        
        self.fingerprintView = [[UIImageView alloc]init];
        self.fingerprintView.frame = self.bounds;
        
        UIImage *image=[UIImage imageNamed:@"fingerprint"];
        //指纹图片的中心点
        CGFloat centerX = image.size.width/2;
        CGFloat centerY = image.size.height/2;
        
        
        //要裁剪的图片区域
        CGRect rect =  CGRectMake(centerX-0.5*cent_x, centerY-0.5*cent_y, cent_x, cent_y);
        CGImageRef cgimg = CGImageCreateWithImageInRect([image CGImage], rect);
        self.fingerprintView.image= [UIImage imageWithCGImage:cgimg];
        //用完一定要释放，否则内存泄露
        CGImageRelease(cgimg);
        
    }
    return _fingerprintView;
    
}

//提供单独的指纹背景，加上原图来做效果。重写setHighlighted:方法，加上点击动画
-(void)setHighlighted:(BOOL)highlighted
{
    
    if (highlighted==YES) {
        self.fingerprintView.alpha = 0.3;
        [self addSubview:self.fingerprintView];
        
        
        [UIView animateWithDuration:0.3 animations:^{
            self.transform = CGAffineTransformMakeScale(0.95, 0.95);
            
        } completion:nil];
        
    }else if (highlighted==NO){
        
        [self.fingerprintView removeFromSuperview];
        [UIView animateWithDuration:0.3 animations:^{
            self.transform = CGAffineTransformIdentity;
            
            
        } completion:^(BOOL finished) {
            
            
        }];
        
    }
    
    
}

//提供一张带指纹的背景图的
//-(void)setHighlighted:(BOOL)highlighted
//{
//    [self setBackgroundImage:[UIImage imageNamed:@"icon"] forState:UIControlStateNormal];
//       if (highlighted==YES) {
//
//
//
//        [UIView animateWithDuration:0.3 animations:^{
//            self.transform = CGAffineTransformMakeScale(0.95, 0.95);
//
//        } completion:^(BOOL finished) {
//
//        }];
//
//    }else{
//
//[self setBackgroundImage:[UIImage imageNamed:@"qunr"] forState:UIControlStateNormal];
//                    }];
//
//        [UIView animateWithDuration:0.3 animations:^{
//            self.transform = CGAffineTransformIdentity;
//
//
//        } completion:^(BOOL finished) {
//
//
//    }
//
//
//}

@end
