//
//  VRSplitViewController.m
//  Top100s
//
//  Created by Vlad-R on 16/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRSplitViewController.h"

@interface VRSplitViewController () <UISplitViewControllerDelegate>

@end

@implementation VRSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
}

#pragma mark - UISplitViewControllerDelegate

- (BOOL)splitViewController:(UISplitViewController *)splitViewController
collapseSecondaryViewController:(UIViewController *)secondaryViewController
  ontoPrimaryViewController:(UIViewController *)primaryViewController
{
    return YES;
}

@end
