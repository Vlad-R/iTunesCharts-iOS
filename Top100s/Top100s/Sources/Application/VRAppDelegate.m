//
//  VRAppDelegate.m
//  Top100s
//
//  Created by Vlad-R on 19/10/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRAppDelegate.h"

#import "VRListViewController.h"
#import "VRMediaTypeListViewModel.h"

@implementation VRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UISplitViewController *splitVC = (UISplitViewController *)self.window.rootViewController;
    UINavigationController *masterNavigationController = (UINavigationController *)splitVC.viewControllers[0];
    
    VRListViewController *mediaTypeListVC = (VRListViewController *)masterNavigationController.topViewController;
    mediaTypeListVC.viewModel = [[VRMediaTypeListViewModel alloc] init];
    
    return YES;
}

@end
