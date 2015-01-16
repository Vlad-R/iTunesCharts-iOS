//
//  VRAppsFeedTypeListViewModel.m
//  Top100s
//
//  Created by Vlad-R on 09/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRAppsFeedTypeListViewModel.h"

#import "VRFreeMobileAppsViewModel.h"

static const NSString *kTopFreeApps = @"Top Free Aplications";
static const NSString *kTopPaidApps = @"Top Paid Applications";

@implementation VRAppsFeedTypeListViewModel

- (NSArray *)list {
    return @[ kTopFreeApps, kTopPaidApps ];
}

- (NSDictionary *)viewModelMap {
    //TODO: Separate
    return @{ ClassMap(kTopFreeApps, VRFreeMobileAppsViewModel),
              ClassMap(kTopPaidApps, VRFreeMobileAppsViewModel) };
}

@end
