//
//  VRFreeMobileAppsViewModel.m
//  Top100s
//
//  Created by Vlad-R on 16/01/15.
//  Copyright (c) 2015 Vlad-R. All rights reserved.
//

#import "VRFreeMobileAppsViewModel.h"

#import "VRCommunicationManager.h"

@implementation VRFreeMobileAppsViewModel

@synthesize model;

- (void)fetchModel:(void (^)())completion {
    __weak typeof(self) weakSelf = self;
    [[VRCommunicationManager sharedManager] freeMobileAppsWithLimit:10 completion:^(VRApps *apps, NSError *error) {
        weakSelf.model = apps;
        if (completion) {
            completion();
        }
    }];
}

@end
