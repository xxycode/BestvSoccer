//
//  AppDelegate.m
//  BestvSoccer
//
//  Created by Apple on 14-6-16.
//  Copyright (c) 2014年 xxy. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "RootViewController.h"
#import "MatchViewController.h"
#import "NewsViewController.h"
#import "VideoViewController.h"
#import "RankViewController.h"
#import "ScoreViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    NSMutableArray *viewControllerArr = [[NSMutableArray alloc] init];
    
    MatchViewController *matchViewController = [[MatchViewController alloc] init];
    [matchViewController setTitle:@"比赛"];
    [viewControllerArr addObject:matchViewController];
    
    NewsViewController *newsViewController = [[NewsViewController alloc] init];
    [newsViewController setTitle:@"资讯"];
    [viewControllerArr addObject:newsViewController];
    
    VideoViewController *videoViewController = [[VideoViewController alloc] init];
    [videoViewController setTitle:@"视频"];
    [viewControllerArr addObject:videoViewController];
    
    RankViewController *rankViewController = [[RankViewController alloc] init];
    [rankViewController setTitle:@"排行"];
    [viewControllerArr addObject:rankViewController];
    
    ScoreViewController *scoreViewController = [[ScoreViewController alloc] init];
    [scoreViewController setTitle:@"积分"];
    [viewControllerArr addObject:scoreViewController];
    
    MainViewController *mainViewController = [[MainViewController alloc] init];
    [mainViewController setViewControllers:viewControllerArr animated:YES];
    
    RootViewController *rootVC = [[RootViewController alloc] initWithRootViewController:mainViewController];
    [self.window setRootViewController:rootVC];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
