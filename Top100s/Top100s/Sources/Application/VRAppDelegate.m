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

@interface VRAppDelegate ()

@property (nonatomic, readonly) UISplitViewController *splitViewController;
@property (nonatomic, readonly) UINavigationController *masterNavigationController;

@end

@implementation VRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    VRListViewController *mediaTypeListVC = (VRListViewController *)self.masterNavigationController.topViewController;
    mediaTypeListVC.viewModel = [[VRMediaTypeListViewModel alloc] init];
    
    return YES;
}

#pragma mark - Accessors

- (UISplitViewController *)splitViewController {
    return (UISplitViewController *)self.window.rootViewController;
}

- (UINavigationController *)masterNavigationController {
    return (UINavigationController *)self.splitViewController.viewControllers[0];
}

@end
