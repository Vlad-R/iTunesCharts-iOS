//
//  VRAppEntryAdapter.m
//  Top100s
//
//  Created by Vlad-R on 14/01/15.
//  Copyright (c) 2015 Vlad-R. All rights reserved.
//

#import "VRAppEntryAdapter.h"

#import "VRPrice.h"

@implementation VRAppEntryAdapter

- (NSString *)name {
    return [(id)self.object name];
}

- (NSString *)artist {
    return [(id)self.object artist];
}

- (NSString *)category {
    return [(id)self.object category];
}

- (NSString *)price {
    return [(VRPrice *)[(id)self.object price] label];
}

- (NSString *)summary {
    return [(id)self.object summary];
}

- (NSString *)link {
    return [(id)self.object link];
}

- (NSArray *)icons {
    return [(id)self.object icons];
}

@end
