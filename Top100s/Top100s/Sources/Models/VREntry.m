//
//  VREntry.m
//  Top100s
//
//  Created by Vlad-R on 26/10/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VREntry.h"

@implementation VREntry

- (NSDictionary *)responseMap {
	return @{ pmap((@[ @"im:name", @"label" ]), name) };
}

@end
