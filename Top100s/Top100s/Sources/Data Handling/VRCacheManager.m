//
//  VRCacheManager.m
//  Top100s
//
//  Created by Vlad-R on 13/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRCacheManager.h"

static const NSTimeInterval kItemLifeSpan = 2.0 * 60 * 24; //2 days

@implementation VRCacheManager

+ (instancetype)sharedManager {
    static VRCacheManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self validateImageCache];
    }
    return self;
}

#pragma mark - Images

- (BOOL)moveImageToCacheFromPath:(NSString *)path withName:(NSString *)name {
    if (!path) {
        return NO;
    }
    
    return [[NSFileManager defaultManager] moveItemAtPath:path
                                                   toPath:[self pathFromImageCacheForFileNamed:name]
                                                    error:nil];
}

- (BOOL)cacheImage:(UIImage *)image withName:(NSString *)name {
    return [UIImagePNGRepresentation(image) writeToFile:[self pathFromImageCacheForFileNamed:name] atomically:YES];
}

- (UIImage *)cachedImageWithName:(NSString *)name {
    return [UIImage imageWithContentsOfFile:[self pathFromImageCacheForFileNamed:name]];
}

- (void)validateImageCache {
    NSDate *now = [NSDate date];
    NSString *path = [self imagesDirectoryPath];
    NSArray *files = [[NSFileManager defaultManager] enumeratorAtPath:path].allObjects;
    for (id iterator in files) {
        NSString *filePath = [NSString stringWithFormat:@"%@/%@", path, iterator];
        NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        NSDate *fileCreationDate = fileAttributes[NSFileCreationDate];
        NSTimeInterval delta = [now timeIntervalSinceDate:fileCreationDate];
        if (delta > kItemLifeSpan) {
            [self deleteItemAtPath:filePath];
        }
    }
}

#pragma mark - File Manager

- (NSString *)pathFromImageCacheForFileNamed:(NSString *)name {
    return [[self imagesDirectoryPath] stringByAppendingPathComponent:name];
}

- (NSString *)imagesDirectoryPath {
    NSString *cachePath = [self dataCacheDirectoryPath];
    NSString *imagesPath = [cachePath stringByAppendingPathComponent:@"Images"];
    
    return [self checkForOrCreateDirectoryAtPath:imagesPath] ? imagesPath : nil;
}

- (NSString *)dataCacheDirectoryPath {
    NSString *documentsPath = [self documentsDirectoryPath];
    NSString *dataCachePath = [documentsPath stringByAppendingPathComponent:@"DataCache"];
    
    return [self checkForOrCreateDirectoryAtPath:dataCachePath] ? dataCachePath : nil;
}

- (NSString *)documentsDirectoryPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return paths.lastObject;
}

- (BOOL)checkForOrCreateDirectoryAtPath:(NSString *)path {
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        return YES;
        
    } else {
        return [[NSFileManager defaultManager] createDirectoryAtPath:path
                                         withIntermediateDirectories:NO
                                                          attributes:nil
                                                               error:nil];
    }
}

#pragma mark - Destruction

- (BOOL)deleteItemAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

- (BOOL)clearImageCache {
    return [[NSFileManager defaultManager] removeItemAtPath:[self imagesDirectoryPath] error:nil];
}

- (BOOL)clearCache {
    return [[NSFileManager defaultManager] removeItemAtPath:[self dataCacheDirectoryPath] error:nil];
}

@end
