//
//  drawerDemoLeftViewController.m
//  DrawerDemo
//
//  Created by jh.Wan on 2017/10/23.
//  Copyright © 2017年 jh.Wan. All rights reserved.
//

#import "drawerDemoLeftViewController.h"
@implementation drawerDemoLeftViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *lable = [[UILabel alloc] init];
    lable.text = @"左菜单栏";
    lable.font = [UIFont systemFontOfSize:20];
    lable.textColor = [UIColor redColor];
    lable.frame = CGRectMake(30, 300, 100, 30);
    [self.view addSubview:lable];
    
}
@end
