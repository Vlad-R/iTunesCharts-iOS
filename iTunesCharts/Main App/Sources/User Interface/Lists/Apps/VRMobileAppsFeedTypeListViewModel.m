//
//  VRMobileAppsFeedTypeListViewModel.m
//  iTunesCharts
//
//  Created by Vlad-R on 17/01/15.
//  Copyright (c) 2015 Vlad-R. All rights reserved.
//

#import "VRMobileAppsFeedTypeListViewModel.h"

#import "VRFreeMobileAppsViewModel.h"
#import "VRPaidMobileAppsViewModel.h"

static const NSString *kTopFreeApps = @"Top Free Aplications";
static const NSString *kTopPaidApps = @"Top Paid Applications";

@implementation VRMobileAppsFeedTypeListViewModel

- (NSArray *)list {
    return @[ kTopFreeApps, kTopPaidApps ];
}

- (NSDictionary *)viewModelMap {
    return @{ ClassMap(kTopFreeApps, VRFreeMobileAppsViewModel),
              ClassMap(kTopPaidApps, VRPaidMobileAppsViewModel) };
}

@end
