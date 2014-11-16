//
//  VREntry.m
//  Top100s
//
//  Created by Vlad-R on 26/10/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VREntry.h"

#import "VRIcon.h"
#import "VRPrice.h"

@implementation VREntry

- (NSDictionary *)responseMap {
	return @{ pmap((@[ @"im:name", @"label" ]), name),
              pmap((@[ @"im:artist", @"label" ]), artist),
			  pmap((@[ @"title", @"label" ]), title),
              pmap((@[ @"category", @"attributes", @"label" ]), category),
			  pmap((@[ @"im:image" ]), icons),
			  pmap((@[ @"summary", @"label" ]), summary),
			  pmap((@[ @"im:price" ]), price),
			  pmap((@[ @"link", @"attributes", @"href" ]), link),
			  pmap((@[ @"im:releaseDate", @"attributes", @"label" ]), releaseDate) };
}

- (NSDictionary *)transformablePropertyMap {
	return @{ transform(icons, VRIcon),
			  transform(price, VRPrice) };
}

@end
