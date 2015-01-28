//
//  VRImageView.h
//  Top100s
//
//  Created by Vlad-R on 14/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import UIKit;

@interface VRImageView : UIImageView

/**
 Downloads, caches, and displays an image from a given URL.
 If the image is already on the drive, it is no longer downloaded, but instead fetched from the cache.
 When the image is cached, it is assigned a unique name derived from the URL from where it was downloaded. The derived name for a URL will always be the same.
 
 @param URL the url from where the image should be downloaded.
 */
- (void)loadImageFromURL:(NSString *)URL;

/**
 Cancels the active image download request.
 */
- (void)cancelRequest;

@end
