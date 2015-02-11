//
//  VREntryAdapter.h
//  Top100s
//
//  Created by Vlad-R on 14/01/15.
//  Copyright (c) 2015 Vlad-R. All rights reserved.
//

#import "VRObjectAdapter.h"

@interface VREntryAdapter : VRObjectAdapter

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *artist;
@property (nonatomic, readonly) NSString *category;
@property (nonatomic, readonly) NSString *price;
@property (nonatomic, readonly) NSString *summary;
@property (nonatomic, readonly) NSString *link;
@property (nonatomic, readonly) NSArray *icons;

@end
