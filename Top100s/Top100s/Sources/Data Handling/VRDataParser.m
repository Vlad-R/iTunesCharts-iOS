//
//  VRDataParser.m
//  Top100s
//
//  Created by Vlad-R on 10/23/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRDataParser.h"

@implementation VRDataParser

+ (id)objectFromJSONData:(NSData *)data {
	if (!data) {
		return nil;
	}
	
	NSError *error = nil;
	return [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
}

@end
