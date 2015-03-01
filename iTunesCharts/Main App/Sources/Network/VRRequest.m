//
//  VRRequest.m
//  iTunesCharts
//
//  Created by Vlad-R on 10/21/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRRequest.h"

@implementation VRRequest

#pragma mark - Public

- (NSString *)host {
    return [NSString stringWithFormat:@"https://itunes.apple.com/%@/rss", [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode]];
}

- (VRRequestType)type {
	return VRRequestTypeGET;
}

- (NSString *)endpoint {
	ASSERT_MISSING_OVERRIDE_IMPLEMENTATION;
	return nil;
}

- (NSDictionary *)parameterMap {
	ASSERT_MISSING_OVERRIDE_IMPLEMENTATION;
    return nil;
}

- (Class<VRModel>)responseModelClass {
	ASSERT_MISSING_OVERRIDE_IMPLEMENTATION;
	return NULL;
}

@end
