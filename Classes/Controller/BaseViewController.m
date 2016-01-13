//
//  BaseViewController.m
//  Nuclear_Power
//
//  Created by 千锋 on 15/11/28.
//  Copyright (c) 2015年 师. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()


@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UINavigationItem *navItem = self.navigationItem;
    
    //标题视图
    UIImageView *titleImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo"]];
    titleImage.frame = CGRectMake(0, 0, 44, 44);
//    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"logos"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBarButton)];
//    navItem.leftBarButtonItem = barButton;
    
    //将自定义视图添加到导航板的标题控件处
    navItem.titleView = titleImage;
    
    UINavigationBar *navBar = self.navigationController.navigationBar;
    UIImage *image64 = [UIImage imageNamed:@"navBar_image3"];
    //设置竖屏的nvBar背景图片
    //UIBarMetricsDefault:竖屏：人像模式
    [navBar setBackgroundImage:image64 forBarMetrics:UIBarMetricsDefault];
}
- (void)pressBarButton
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
