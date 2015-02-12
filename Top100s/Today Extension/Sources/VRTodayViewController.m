//
//  VRTodayViewController.m
//  Top100s
//
//  Created by Vlad-R on 12/02/15.
//  Copyright (c) 2015 Vlad-R. All rights reserved.
//

@import NotificationCenter;

#import "VRTodayViewController.h"

@interface VRTodayViewController () <NCWidgetProviding>

@end

@implementation VRTodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData
    
    completionHandler(NCUpdateResultNewData);
}

@end
