//
//  VRMediaTypeListViewModel.m
//  Top100s
//
//  Created by Vlad-R on 09/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRMediaTypeListViewModel.h"

#import "VRBooksFeedTypeListViewModel.h"
#import "VRMacAppsFeedTypeListViewModel.h"
#import "VRMobileAppsFeedTypeListViewModel.h"

static const NSString *kBooks = @"Books";
static const NSString *kiOSApps = @"iOS Apps";
static const NSString *kMacApps = @"Mac Apps";

@implementation VRMediaTypeListViewModel

- (NSArray *)list {
    return @[ kBooks, kiOSApps, kMacApps ];
}

- (NSDictionary *)viewModelMap {
    return @{ ClassMap(kBooks, VRBooksFeedTypeListViewModel),
              ClassMap(kiOSApps, VRMobileAppsFeedTypeListViewModel),
              ClassMap(kMacApps, VRMacAppsFeedTypeListViewModel) };
}

@end
