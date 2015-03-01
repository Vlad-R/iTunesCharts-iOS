//
//  VRCacheManager.h
//  iTunesCharts
//
//  Created by Vlad-R on 13/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import Foundation;

@interface VRCacheManager : NSObject

/**
 Creates a singleton instance of the class.
 */
+ (instancetype)sharedManager;

/**
 Moves an image from a given path to the image cache.
 
 @param path The image's initial path.
 @param name The name under which the image will be saved.
 @return A boolean indicating whether the operation was successful or not.
 */
- (BOOL)moveImageToCacheFromPath:(NSString *)path withName:(NSString *)name;

/**
 Saves an image to the image cache.
 
 @param image The image to be saved.
 @param name The name under which the image will be saved.
 @return A boolean indicating whether the operation was successful or not.
 */
- (BOOL)cacheImage:(UIImage *)image withName:(NSString *)name;

/**
 Fetches an image from the image cache.
 
 @param name The name under which the image is saved.
 @return The requested image as a UIImage.
 */
- (UIImage *)cachedImageWithName:(NSString *)name;

@end
