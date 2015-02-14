//
//  VRPaidBooksViewModel.m
//  Top100s
//
//  Created by Vlad-R on 17/01/15.
//  Copyright (c) 2015 Vlad-R. All rights reserved.
//

#import "VRPaidBooksViewModel.h"

#import "VRCommunicationManager.h"

@implementation VRPaidBooksViewModel

@synthesize model;

- (void)fetchModel:(void (^)())completion {
    __weak typeof(self) weakSelf = self;
    [[VRCommunicationManager sharedManager] paidBooksWithLimit:[VRUserDefaults settingsBundleNumberOfItemsToRequest]
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
