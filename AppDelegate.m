//
//  AppDelegate.m
//  Nuclear_Power
//
//  Created by 千锋 on 15/11/28.
//  Copyright (c) 2015年 师. All rights reserved.
//

#import "AppDelegate.h"
#import "SHIIntroduceViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"


@interface AppDelegate ()

@property (nonatomic, strong) SHIIntroduceViewController *introductionView;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];

    [self creatTabBar];
    
    // 添加背景图片
    NSArray *coverImageNames = @[@"img_index_01txt", @"img_index_02txt", @"img_index_03txt"];
    NSArray *backgroundImageNames = @[@"img_index_01bg", @"img_index_02bg", @"img_index_03bg"];
    
    self.introductionView = [[SHIIntroduceViewController alloc] initWithCoverImageNames:coverImageNames backgroundImageNames:backgroundImageNames];
    
    [self.window addSubview:self.introductionView.view];
    
    __weak AppDelegate *weakSelf = self;
    self.introductionView.didSelectedEnter = ^() {
        weakSelf.introductionView = nil;
    };
    

    return YES;
}

- (void)creatTabBar
{
    UITabBarController *tbv = [[UITabBarController alloc]init];
    
    //获取tabBar的指针
    UITabBar *tabBar = tbv.tabBar;
    //设置tabBar的背景图片
    tabBar.backgroundImage = [UIImage imageNamed:@"tabbackImage"];
    

    //通过图片，选中图片，标题创建
    FirstViewController *first = [[FirstViewController alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:first];
    UITabBarItem *item1 = [[UITabBarItem alloc]initWithTitle:@"核电科普" image:[UIImage imageNamed:@"tab_0"] tag:101];
    item1.tag = 102;
    first.tabBarItem = item1;
    
    
    SecondViewController *second = [[SecondViewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:second];
    UITabBarItem *item2 = [[UITabBarItem alloc]initWithTitle:@"核电现状" image:[UIImage imageNamed:@"tab_2"] tag:103];
    second.tabBarItem = item2;
    
    ThirdViewController *third = [[ThirdViewController alloc]init];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:third];
    //通过图片和标题创建
    UITabBarItem *item3 = [[UITabBarItem alloc]initWithTitle:@"行内动态" image:[UIImage imageNamed:@"tab_1"] tag:104];
    third.tabBarItem = item3;
    
    FourthViewController *fourth = [[FourthViewController alloc]init];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:fourth];
    UITabBarItem *item4 = [[UITabBarItem alloc]initWithTitle:@"设置" image:[UIImage imageNamed:@"tab_3"] tag:105];
    fourth.tabBarItem = item4;
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSArray *array = [user objectForKey:@"userCustom"];
    NSArray *navs = @[nav1,nav2,nav3,nav4];
    if (array.count > 0) {
        NSMutableArray *mArr = [NSMutableArray  array];
        for (NSNumber *num in array) {
            for (UINavigationController *na in navs) {
                if (num.intValue == [na.viewControllers[0] tabBarItem].tag) {
                    [mArr addObject:na];
                    break;
                }
            }
        }
        tbv.viewControllers = mArr;
    }else
    {
        tbv.viewControllers = navs;
    }
    //设置默认选中的界面
    tbv.selectedIndex = 0;
    tbv.delegate = self;
    _window.rootViewController = tbv;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
