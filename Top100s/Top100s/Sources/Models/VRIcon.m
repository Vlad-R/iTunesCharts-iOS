//
//  VRIcon.m
//  Top100s
//
//  Created by Vlad-R on 10/28/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRIcon.h"

@implementation VRIcon

- (NSDictionary *)responseMap {
	return @{ pmap(@[ @"label" ], URL),
			  pmap((@[ @"attributes", @"height" ]), height) };
}

@end
