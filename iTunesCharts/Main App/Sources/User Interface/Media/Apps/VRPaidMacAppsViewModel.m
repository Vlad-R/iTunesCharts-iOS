//
//  VRPaidMacAppsViewModel.m
//  iTunesCharts
//
//  Created by Vlad-R on 17/01/15.
//  Copyright (c) 2015 Vlad-R. All rights reserved.
//

#import "VRPaidMacAppsViewModel.h"

#import "VRCommunicationManager.h"

@implementation VRPaidMacAppsViewModel

@synthesize model;

- (void)fetchModel:(void (^)())completion {
    __weak typeof(self) weakSelf = self;
    [[VRCommunicationManager sharedManager] paidMacAppsWithLimit:[VRUserDefaults settingsBundleNumberOfItemsToRequest]
                                                          sender:self
                                                      completion:^(VRApps *apps, NSError *error) {
                                                          weakSelf.model = apps;
                                                          if (completion) {
                                                              completion();
                                                          }
                                                      }];
}

- (void)dealloc {
    [[VRCommunicationManager sharedManager] cancelAllRequestsForSender:self];
}

@end
