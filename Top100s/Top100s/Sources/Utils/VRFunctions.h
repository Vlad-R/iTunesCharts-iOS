//
//  VRFunctions.h
//  Top100s
//
//  Created by Vlad-R on 10/27/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import Foundation;

static inline NSString *JSON_KEYPATH(NSArray *keys) {
	NSMutableString *result = [NSMutableString string];
	[keys enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
		if (idx > 0) {
			[result appendFormat:@"->%@", obj];
		} else {
			[result appendString:obj];
		}
	}];
	
	return [NSString stringWithString:result];
}

static inline NSArray *JSON_KEYS(NSString *string) {
	return [string componentsSeparatedByString:@"->"];
}
