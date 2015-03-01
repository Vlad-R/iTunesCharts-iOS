//
//  VRFreeBooksViewModel.m
//  iTunesCharts
//
//  Created by Vlad-R on 23/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRFreeBooksViewModel.h"

#import "VRCommunicationManager.h"

@implementation VRFreeBooksViewModel

@synthesize model;

- (void)fetchModel:(void (^)())completion {
    __weak typeof(self) weakSelf = self;
    [[VRCommunicationManager sharedManager] freeBooksWithLimit:[VRUserDefaults settingsBundleNumberOfItemsToRequest]
                                                        sender:self
                                                    completion:^(VRBooks *books, NSError *error) {
                                                        weakSelf.model = books;
                                                        if (completion) {
                                                            completion();
                                                        }
                                                    }];
}

- (void)dealloc {
    [[VRCommunicationManager sharedManager] cancelAllRequestsForSender:self];
}

@end
