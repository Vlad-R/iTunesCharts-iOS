//
//  VRMacAppsFeedTypeListViewModel.m
//  Top100s
//
//  Created by Vlad-R on 17/01/15.
//  Copyright (c) 2015 Vlad-R. All rights reserved.
//

#import "VRMacAppsFeedTypeListViewModel.h"

#import "VRFreeMacAppsViewModel.h"
#import "VRPaidMacAppsViewModel.h"

static const NSString *kTopFreeApps = @"Top Free Aplications";
static const NSString *kTopPaidApps = @"Top Paid Applications";

@implementation VRMacAppsFeedTypeListViewModel

- (NSArray *)list {
    return @[ kTopFreeApps, kTopPaidApps ];
}

- (NSDictionary *)viewModelMap {
    return @{ ClassMap(kTopFreeApps, VRFreeMacAppsViewModel),
              ClassMap(kTopPaidApps, VRPaidMacAppsViewModel) };
}

@end
