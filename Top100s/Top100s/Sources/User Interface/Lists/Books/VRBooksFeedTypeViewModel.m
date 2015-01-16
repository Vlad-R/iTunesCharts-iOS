//
//  VRBooksFeedTypeViewModel.m
//  Top100s
//
//  Created by Vlad-R on 22/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRBooksFeedTypeViewModel.h"

#import "VRFreeBooksViewModel.h"

static const NSString *kTopFreeBooks = @"Top Free Books";
static const NSString *kTopPaidBooks = @"Top Paid Books";
static const NSString *kTopTextbooks = @"Top Textbooks";

@implementation VRBooksFeedTypeViewModel

- (NSArray *)list {
    return @[ kTopFreeBooks, kTopPaidBooks, kTopTextbooks ];
}

- (NSDictionary *)viewModelMap {
    //TODO: handle independent cases
    return @{ ClassMap(kTopFreeBooks, VRFreeBooksViewModel),
              ClassMap(kTopPaidBooks, VRFreeBooksViewModel),
              ClassMap(kTopTextbooks, VRFreeBooksViewModel) };
}

@end
