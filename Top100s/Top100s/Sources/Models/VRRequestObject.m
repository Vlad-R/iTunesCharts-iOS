//
//  VRRequestObject.m
//  Top100s
//
//  Created by Vlad-R on 10/21/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRRequestObject.h"

@implementation VRRequestObject

#pragma mark - Public

- (NSString *)endpoint {
	return nil;
}

- (NSDictionary *)parameterMap {
	return @{ @"limit" : self.limit };
}

#pragma mark - Private

- (NSString *)host {
	return [NSString stringWithFormat:@"https://itunes.apple.com/%@/rss", [self countryCode]];
}

- (NSString *)countryCode {
	return [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
}

@end
