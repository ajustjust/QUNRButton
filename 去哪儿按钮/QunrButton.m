//
//  Qubutton.m
//  去哪儿按钮
//
//  Created by xxzx on 15/7/14.
//  Copyright (c) 2015年 hxyxt. All rights reserved.
//

#import "QunrButton.h"

@interface QunrButton ()

@property (nonatomic,strong)UIImageView *zw;
@end
@implementation QunrButton
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



//-(UIImageView *)zw
//{
//    if (!_zw) {
//        _zw= [[UIImageView alloc]init];
//        
//        self.zw = [[UIImageView alloc]init];
//        
//        self.zw.frame = self.bounds;
//        
//        self.zw.image =[UIImage imageNamed:@"zw"];
//
//    }
//    return _zw;
//
//}

-(UIImageView *)zw
{
    if (!_zw) {
        _zw= [[UIImageView alloc]init];
        
        self.zw = [[UIImageView alloc]init];
        
        self.zw.frame = self.bounds;
        
        
#define cent_x self.bounds.size.width
        
#define cent_y self.bounds.size.height
         UIImage *image=[UIImage imageNamed:@"zw副本"];
      
        //指纹图片的中心点
        CGFloat centerX = image.size.width/2;
        CGFloat centerY = image.size.height/2;
       
        
        //要裁剪的图片区域
        CGRect rect =  CGRectMake(centerX-0.5*cent_x, centerY-0.5*cent_y, cent_x, cent_y);
        CGImageRef cgimg = CGImageCreateWithImageInRect([image CGImage], rect);
        self.zw.image= [UIImage imageWithCGImage:cgimg];
        //用完一定要释放，否则内存泄露
        CGImageRelease(cgimg);
      
    }
    return _zw;
    
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
//提供单独的指纹背景，加上原图来做效果。重写setHighlighted:方法，加上点击动画
-(void)setHighlighted:(BOOL)highlighted
{
    
    if (highlighted==YES) {
            self.zw.alpha = 0.3;
      [self addSubview:self.zw];
    
        
        [UIView animateWithDuration:0.3 animations:^{
            self.transform = CGAffineTransformMakeScale(0.95, 0.95);
            
        } completion:nil];
        
    }else if (highlighted==NO){
        
               [self.zw removeFromSuperview];
        [UIView animateWithDuration:0.3 animations:^{
            self.transform = CGAffineTransformIdentity;
            
            
        } completion:^(BOOL finished) {
            
          
     

            
            
        }];
        
    }
    
    
}



@end
