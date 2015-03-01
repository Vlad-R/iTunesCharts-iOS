//
//  NSObject+UUID.m
//  iTunesCharts
//
//  Created by Vlad-R on 18/01/15.
//  Copyright (c) 2015 Vlad-R. All rights reserved.
//

@import ObjectiveC.runtime;

#import "NSObject+UUID.h"

static char kUniqueIdentifierKey;

@implementation NSObject(UUID)

- (NSString *)uniqueIdentifier {
    NSString *ident = objc_getAssociatedObject(self, &kUniqueIdentifierKey);
    if (!ident) {
        ident = [[NSUUID UUID] UUIDString];
        objc_setAssociatedObject(self, &kUniqueIdentifierKey, ident, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return ident;
}

@end
