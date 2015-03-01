//
//  VRIcon.m
//  iTunesCharts
//
//  Created by Vlad-R on 10/28/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRIcon.h"

@implementation VRIcon

- (id)copyWithZone:(NSZone *)zone {
    VRIcon *copy = [[VRIcon allocWithZone:zone] init];
    copy.URL = self.URL;
    copy.height = self.height;
    
    return copy;
}

- (NSDictionary *)responseMap {
	return @{ pmap((@[ @"label" ]), URL),
			  pmap((@[ @"attributes", @"height" ]), height) };
}

@end
