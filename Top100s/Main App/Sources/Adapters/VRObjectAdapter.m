//
//  VRObjectAdapter.m
//  Top100s
//
//  Created by Vlad-R on 23/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRObjectAdapter.h"

#import "VRAppEntry.h"
#import "VRAppEntryAdapter.h"
#import "VRBookEntry.h"
#import "VRBookEntryAdapter.h"

@implementation VRObjectAdapter

+ (instancetype)adapterFromObject:(id<NSObject, NSCopying>)object {
    Class adapterClass = [self adapterMap][CLASS(object)];
    return [[adapterClass alloc] initWithObject:object];
}

- (instancetype)initWithObject:(id<NSObject, NSCopying>)object {
    self = [super init];
    if (self) {
        self.object = object;
    }
    return self;
}

#pragma mark - Private

+ (NSDictionary *)adapterMap {
    static NSDictionary *map = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        map = @{ CLASS(VRAppEntry) : [VRAppEntryAdapter class],
                 CLASS(VRBookEntry) : [VRBookEntryAdapter class] };
    });
    
    return map;
}

@end
