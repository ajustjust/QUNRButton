//
//  ViewController.m
//  去哪儿按钮
//
//  Created by xxzx on 15/7/14.
//  Copyright (c) 2015年 hxyxt. All rights reserved.
//

#import "ViewController.h"
#import "QunrButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //添加去哪儿网样式按钮
    QunrButton * qu = [[QunrButton alloc]init];
    qu.frame = CGRectMake(40, 50, 70, 70);
    [qu setBackgroundImage:[UIImage imageNamed:@"qunr"] forState:UIControlStateNormal];
   
  
      [self.view addSubview:qu];
    
}


@end
