//
//  VRCacheManager.m
//  Top100s
//
//  Created by Vlad-R on 13/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRCacheManager.h"

@implementation VRCacheManager

#pragma mark - Images

+ (BOOL)moveImageToCacheFromPath:(NSString *)path withName:(NSString *)name {
    if (!path) {
        return NO;
    }
    
    return [[NSFileManager defaultManager] moveItemAtPath:path
                                                   toPath:[self pathFromImageCacheForFileNamed:name]
                                                    error:nil];
}

+ (BOOL)cacheImage:(UIImage *)image withName:(NSString *)name {
    return [UIImagePNGRepresentation(image) writeToFile:[self pathFromImageCacheForFileNamed:name] atomically:YES];
}

+ (UIImage *)cachedImageWithName:(NSString *)name {
    return [UIImage imageWithContentsOfFile:[self pathFromImageCacheForFileNamed:name]];
}

#pragma mark - File Manager

+ (NSString *)pathFromImageCacheForFileNamed:(NSString *)name {
    return [[self imagesDirectoryPath] stringByAppendingPathComponent:name];
}

+ (NSString *)imagesDirectoryPath {
    NSString *cachePath = [self dataCacheDirectoryPath];
    NSString *imagesPath = [cachePath stringByAppendingPathComponent:@"Images"];
    
    return [self checkForOrCreateDirectoryAtPath:imagesPath] ? imagesPath : nil;
}

+ (NSString *)dataCacheDirectoryPath {
    NSString *documentsPath = [self documentsDirectoryPath];
    NSString *dataCachePath = [documentsPath stringByAppendingPathComponent:@"DataCache"];
    
    return [self checkForOrCreateDirectoryAtPath:dataCachePath] ? dataCachePath : nil;
}

+ (NSString *)documentsDirectoryPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return paths.lastObject;
}

+ (BOOL)checkForOrCreateDirectoryAtPath:(NSString *)path {
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        return YES;
        
    } else {
        return [[NSFileManager defaultManager] createDirectoryAtPath:path
                                         withIntermediateDirectories:NO
                                                          attributes:nil
                                                               error:nil];
    }
}

@end
