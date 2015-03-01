//
//  VRSplitViewController.m
//  iTunesCharts
//
//  Created by Vlad-R on 16/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRSplitViewController.h"

#import "VRBlankViewController.h"
#import "VRDetailsViewController.h"
#import "VRListViewController.h"
#import "VRMediaViewController.h"

@implementation VRSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
}

#pragma mark - UISplitViewControllerDelegate

- (BOOL)        splitViewController:(UISplitViewController *)splitViewController
    collapseSecondaryViewController:(UIViewController *)secondaryViewController //detail
          ontoPrimaryViewController:(UIViewController *)primaryViewController //master
{
    id topVC = ((UINavigationController *)secondaryViewController).topViewController;
    return ([topVC isKindOfClass:[VRDetailsViewController class]] && ![topVC model]) || [topVC isKindOfClass:[VRBlankViewController class]];
}

- (UIViewController *)                  splitViewController:(UISplitViewController *)splitViewController
   separateSecondaryViewControllerFromPrimaryViewController:(UIViewController *)primaryViewController
{
    id topVC = [(UINavigationController *)primaryViewController topViewController];
    if ([topVC isKindOfClass:[VRMediaViewController class]] || [topVC isKindOfClass:[VRListViewController class]]) {
        return [self.storyboard instantiateViewControllerWithIdentifier:@"NoContentViewController"];
    }
    
    return nil;
}

@end
