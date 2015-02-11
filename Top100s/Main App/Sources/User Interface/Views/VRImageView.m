//
//  VRImageView.m
//  Top100s
//
//  Created by Vlad-R on 14/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRImageView.h"

#import "UIView+Activity.h"
#import "VRCacheManager.h"
#import "VRCommunicationManager.h"

@implementation VRImageView

- (void)loadImageFromURL:(NSString *)URL {
    NSString *imageName = name_for_URL(URL);
    UIImage *cachedImage = [[VRCacheManager sharedManager] cachedImageWithName:imageName];
    if (cachedImage) {
        self.image = cachedImage;
        
    } else {
        self.activityViewVisible = YES;
        [[VRCommunicationManager sharedManager] downloadFileFromURL:[NSURL URLWithString:URL]
                                                             sender:self
                                                         completion:^(NSString *tempPath, NSError *error) {
                                                             [[VRCacheManager sharedManager] moveImageToCacheFromPath:tempPath withName:imageName];
                                                             dispatch_async(dispatch_get_main_queue(), ^{
                                                                 self.image = [[VRCacheManager sharedManager] cachedImageWithName:imageName];
                                                                 self.activityViewVisible = NO;
                                                             });
                                                         }];
    }
}

- (void)cancelRequest {
    [[VRCommunicationManager sharedManager] cancelAllRequestsForSender:self];
}

- (void)dealloc {
    [self cancelRequest];
}

@end
