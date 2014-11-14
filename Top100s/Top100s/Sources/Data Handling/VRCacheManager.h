//
//  VRCacheManager.h
//  Top100s
//
//  Created by Vlad-R on 13/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import Foundation;

@interface VRCacheManager : NSObject

+ (BOOL)moveImageToCacheFromPath:(NSString *)path withName:(NSString *)name;
+ (BOOL)cacheImage:(UIImage *)image withName:(NSString *)name;
+ (UIImage *)cachedImageWithName:(NSString *)name;

@end
