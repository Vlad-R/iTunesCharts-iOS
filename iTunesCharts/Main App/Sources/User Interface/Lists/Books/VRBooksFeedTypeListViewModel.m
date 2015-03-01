//
//  VRBooksFeedTypeListViewModel.m
//  iTunesCharts
//
//  Created by Vlad-R on 17/01/15.
//  Copyright (c) 2015 Vlad-R. All rights reserved.
//

#import "VRBooksFeedTypeListViewModel.h"

#import "VRFreeBooksViewModel.h"
#import "VRPaidBooksViewModel.h"
#import "VRTextbooksViewModel.h"

static const NSString *kTopFreeBooks = @"Top Free Books";
static const NSString *kTopPaidBooks = @"Top Paid Books";
static const NSString *kTopTextbooks = @"Top Textbooks";

@implementation VRBooksFeedTypeListViewModel

- (NSArray *)list {
    return @[ kTopFreeBooks, kTopPaidBooks, kTopTextbooks ];
}

- (NSDictionary *)viewModelMap {
    return @{ ClassMap(kTopFreeBooks, VRFreeBooksViewModel),
              ClassMap(kTopPaidBooks, VRPaidBooksViewModel),
              ClassMap(kTopTextbooks, VRTextbooksViewModel) };
}

@end
