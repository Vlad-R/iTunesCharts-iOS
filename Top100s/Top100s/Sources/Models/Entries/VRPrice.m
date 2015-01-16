//
//  VRPrice.m
//  Top100s
//
//  Created by Vlad-R on 10/28/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRPrice.h"

@implementation VRPrice

- (id)copyWithZone:(NSZone *)zone {
    VRPrice *copy = [[VRPrice allocWithZone:zone] init];
    copy.label = self.label;
    copy.amount = self.amount;
    copy.currency = self.currency;
    
    return copy;
}

- (NSDictionary *)responseMap {
	return @{ pmap((@[ @"label" ]), label),
			  pmap((@[ @"attributes", @"amount" ]), amount),
			  pmap((@[ @"attributes", @"currency" ]), currency) };
}

@end
