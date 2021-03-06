//
//  VRAppEntry.m
//  iTunesCharts
//
//  Created by Vlad-R on 12/01/15.
//  Copyright (c) 2015 Vlad-R. All rights reserved.
//

#import "VRAppEntry.h"

#import "VRIcon.h"
#import "VRPrice.h"

@implementation VRAppEntry

- (id)copyWithZone:(NSZone *)zone {
    VRAppEntry *copy = [[VRAppEntry allocWithZone:zone] init];
    copy.name = self.name;
    copy.artist = self.artist;
    copy.title = self.title;
    copy.category = self.category;
    copy.icons = self.icons;
    copy.summary = self.summary;
    copy.price = self.price;
    copy.link = self.link;
    copy.releaseDate = self.releaseDate;
    
    return copy;
}

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
