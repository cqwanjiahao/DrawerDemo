//
//  drawerDemoCenterViewController.m
//  DrawerDemo
//
//  Created by jh.Wan on 2017/10/23.
//  Copyright © 2017年 jh.Wan. All rights reserved.
//

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#import "drawerDemoCenterViewController.h"
#import "Masonry.h"
@interface drawerDemoCenterViewController ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIScrollView *contentScrollView;
@end
@implementation drawerDemoCenterViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupViews];
  [self setupNavgation];
  [self dealConflict];
}

- (void)setupViews {
  self.title = @"ScrollView";
  //创建View
  self.contentScrollView.frame = self.view.frame;
  UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT)];
  view1.backgroundColor = [UIColor redColor];
  UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(1 * SCREEN_WIDTH, 0, SCREEN_WIDTH,SCREEN_HEIGHT)];
  view2.backgroundColor = [UIColor yellowColor];
  UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(2 * SCREEN_WIDTH, 0, SCREEN_WIDTH,SCREEN_HEIGHT)];
  view3.backgroundColor = [UIColor blueColor];
  //添加view
  [self.view addSubview:self.contentScrollView];
  [self.contentScrollView addSubview:view1];
  [self.contentScrollView addSubview:view2];
  [self.contentScrollView addSubview:view3];
  
  //设置scrollview
  self.contentScrollView.bounces = NO;
  self.contentScrollView.pagingEnabled = YES;
  self.contentScrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3,0);
}

- (void)setupNavgation {
  //1.设置导航栏颜色
  self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:62/255.0 green:173/255.0 blue:176/255.0 alpha:1.0];
  //2.设置左右导航栏按钮
  self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"左抽屉" style:UIBarButtonItemStylePlain target:self action:@selector(didTapLeftBarButton)];
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右抽屉" style:UIBarButtonItemStylePlain target:self action:@selector(didTapRightBarButton)];
}

- (void)didTapLeftBarButton {
  [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)didTapRightBarButton {
  [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

//解决scrollview与抽屉控制器冲突
- (void)dealConflict {
  /*方法1. 使用UIScrollViewDelegate  :  - (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {}
   */
  
  self.contentScrollView.delegate = self;  //成为代理,遵守协议,执行方法
  
  /*方法2. 使用UIGestureRecognizerDelegate   - (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {}
   */
  
  //  UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:nil];//创建一个空手势
  //  [self.contentScrollView addGestureRecognizer:pan];//添加空手势
  //  pan.delegate = self; //成为代理,遵守协议,执行代理方法
}

///Way 1:执行scrollView代理方法
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
  //获取滑动偏移量
  float tagetX = targetContentOffset->x;
  //向左滑动时： 如果滑动后的X为最小（最小的X值），并且 为第一个控制器(contentOffsetX 为最小0)
  //向右滑动时： 如果滑动后的X为最大（最大的X值），并且为最后一个控制器（contentOffsetX 为最大）
  if (tagetX == 0 && self.contentScrollView.contentOffset.x == 0 * SCREEN_WIDTH) {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
  } else if (tagetX == 2 * SCREEN_WIDTH  && self.contentScrollView.contentOffset.x == 2 * SCREEN_WIDTH) {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
  }
}

////Way 2:执行手势代理方法
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//  if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
//    UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
//    CGPoint pos = [pan velocityInView:pan.view];
//    if (pos.x > SCREEN_WIDTH /3 && self.contentScrollView.contentOffset.x == 0 * SCREEN_WIDTH) {
//      [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
//      return YES;
//    } else if (pos.x < -SCREEN_WIDTH /3 && self.contentScrollView.contentOffset.x == 2 * SCREEN_WIDTH) {
//      [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
//      return YES;
//    }
//  }
//  return NO;
//}

- (UIScrollView *)contentScrollView {
  if (!_contentScrollView) {
    _contentScrollView = [[UIScrollView alloc] init];
    _contentScrollView.backgroundColor = [UIColor whiteColor];
  }
  return _contentScrollView;
}
@end

