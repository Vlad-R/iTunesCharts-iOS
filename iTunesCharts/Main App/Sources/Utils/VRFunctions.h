//
//  VRFunctions.h
//  iTunesCharts
//
//  Created by Vlad-R on 10/27/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#ifndef VRFunctions_Header
#define VRFunctions_Header


@import Foundation;

static inline NSString *json_keypath(NSArray *keys) {
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

static inline NSArray *json_keys(NSString *string) {
	return [string componentsSeparatedByString:@"->"];
}

static inline NSString *name_for_URL(NSString *URL) {
    NSString *result = [URL stringByReplacingOccurrencesOfString:@"/" withString:@""];
    result = [result stringByReplacingOccurrencesOfString:@":" withString:@""];
    result = [result stringByReplacingOccurrencesOfString:@"." withString:@""];
    
    return result;
}


#endif
