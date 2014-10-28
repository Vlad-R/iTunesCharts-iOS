//
//  VRPrice.m
//  Top100s
//
//  Created by Vlad-R on 10/28/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRPrice.h"

@implementation VRPrice

- (NSDictionary *)responseMap {
	return @{ pmap((@[ @"label" ]), label),
			  pmap((@[ @"attributes", @"amount" ]), amount),
			  pmap((@[ @"attributes", @"currency" ]), currency) };
}

@end
