//
//  VRList.m
//  Top100s
//
//  Created by Vlad-R on 10/29/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRList.h"


@implementation VRList

- (NSString *)jsonInitializationKey {
	return @"feed";
}

- (NSDictionary *)responseMap {
	return @{ pmap((@[ @"author", @"name", @"label" ]), author),
			  pmap((@[ @"entry" ]), entries) };
}

@end


@implementation VRListRequest

- (NSDictionary *)parameterMap {
	return @{ pmap((@[ @"limit" ]), limit) };
}

@end
