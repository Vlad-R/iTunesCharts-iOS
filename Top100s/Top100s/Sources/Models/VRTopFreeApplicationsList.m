//
//  VRTopFreeApplicationsList.m
//  Top100s
//
//  Created by Vlad-R on 10/21/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRTopFreeApplicationsList.h"

@implementation VRTopFreeApplicationsList

- (NSString *)endpoint {
	return @"/topfreeapplications";
}

- (NSDictionary *)parameterMap {
	return @{ @"limit" : self.limit,
			  @"genre" : @"6015" };
}

@end
