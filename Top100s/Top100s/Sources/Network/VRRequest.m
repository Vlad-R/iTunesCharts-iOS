//
//  VRRequest.m
//  Top100s
//
//  Created by Vlad-R on 10/21/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRRequest.h"

@implementation VRRequest

#pragma mark - Public

- (NSString *)host {
    return [NSString stringWithFormat:@"https://itunes.apple.com/%@/rss", [self countryCode]];
}

- (NSString *)endpoint {
	return nil;
}

- (NSDictionary *)parameterMap {
    return nil;
}

#pragma mark - Private

- (NSString *)countryCode {
	return [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
}

@end
