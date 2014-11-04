//
//  VRAppDelegate.m
//  Top100s
//
//  Created by Vlad-R on 19/10/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRAppDelegate.h"

#import "VRListViewController.h"

@implementation VRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UISplitViewController *splitVC = (UISplitViewController *)self.window.rootViewController;
    __weak UINavigationController *masterNavigationController = (UINavigationController *)splitVC.viewControllers[0];
    
    VRListViewController *mediaTypeListVC = (VRListViewController *)masterNavigationController.topViewController;
    mediaTypeListVC.list = @[ @"iOS Apps", @"Mac Apps" ];
    mediaTypeListVC.selectCellAction = ^(UITableView *tableView, NSIndexPath *indexPath) {
        VRListViewController *feedTypeListVC = [[VRListViewController alloc] init];
        feedTypeListVC.list = @[ @"Top Free Aplications", @"Top Paid Applications" ];
        feedTypeListVC.selectCellAction = ^(UITableView *tableView, NSIndexPath *indexPath) {
            NSLog(@"%@", indexPath);
        };
        [masterNavigationController pushViewController:feedTypeListVC animated:YES];
    };
    
    return YES;
}

@end
