//
//  VRUserDefaults.m
//  iTunesCharts
//
//  Created by Vlad-R on 14/02/15.
//  Copyright (c) 2015 Vlad-R. All rights reserved.
//

#import "VRUserDefaults.h"

@implementation VRUserDefaults

+ (NSUInteger)settingsBundleNumberOfItemsToRequest {
    NSString *count = [[NSUserDefaults standardUserDefaults] stringForKey:@"number_of_items_to_request"];
    return count ? count.integerValue : 10;
}

@end
