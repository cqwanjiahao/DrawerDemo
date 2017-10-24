//
//  drawerDemoLRightViewController.m
//  DrawerDemo
//
//  Created by jh.Wan on 2017/10/24.
//  Copyright © 2017年 jh.Wan. All rights reserved.
//

#import "drawerDemoLRightViewController.h"

@interface drawerDemoLRightViewController ()

@end

@implementation drawerDemoLRightViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  UILabel *lable = [[UILabel alloc] init];
  lable.text = @"右菜单栏";
  lable.font = [UIFont systemFontOfSize:20];
  lable.textColor = [UIColor blackColor];
  lable.frame = CGRectMake(100, 300, 100, 30);
  [self.view addSubview:lable];
  
}
@end
