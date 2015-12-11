//
//  AppDelegate.m
//  YolandaRACDemo
//
//  Created by linwenbang on 15/12/11.
//  Copyright © 2015年 yolanda. All rights reserved.
//


#import "AppDelegate.h"
#import "ChoiceViewController.h"
#import "ChoiceViewModel.h"
#import "ChoiceView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ChoiceViewModel *choiceVM = [[ChoiceViewModel alloc] init];
    ChoiceView *choiceView = [[ChoiceView alloc] init];
    
    ChoiceViewController *choiceViewController = [[ChoiceViewController alloc] initWithViewModel:choiceVM customView:choiceView];
    
    UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:choiceViewController];
    choiceVM.navigationController = navVc;
    
    self.window.rootViewController = navVc;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
