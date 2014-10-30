//
//  VRHomeViewModel.m
//  Top100s
//
//  Created by Vlad-R on 10/30/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRHomeViewModel.h"

#import "VRCommunicationManager.h"

@implementation VRHomeViewModel

- (void)fetchModel:(void (^)())completion {
	[[VRCommunicationManager sharedManager] freeMobileAppsWithLimit:10 completion:^(VRApps *model, NSError *error) {
		self.model = model;
		if (completion) {
			completion();
		}
	}];
}

@end
