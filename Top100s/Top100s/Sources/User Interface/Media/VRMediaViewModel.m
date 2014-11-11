//
//  VRMediaViewModel.m
//  Top100s
//
//  Created by Vlad-R on 12/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRMediaViewModel.h"

#import "VRCommunicationManager.h"

@implementation VRMediaViewModel

- (void)fetchModel:(void (^)())completion {
    __weak typeof(self) weakSelf = self;
    [[VRCommunicationManager sharedManager] freeMobileAppsWithLimit:10 completion:^(VRApps *model, NSError *error) {
        weakSelf.model = model;
        if (completion) {
            completion();
        }
    }];
}

@end
