//
//  VRCommunicationManager.h
//  Top100s
//
//  Created by Vlad-R on 10/21/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import Foundation;

@class VRApps;
@class VRBooks;

@interface VRCommunicationManager : NSObject

+ (instancetype)sharedManager;

- (NSURLSessionTask *)freeMobileAppsWithLimit:(NSUInteger)limit completion:(void(^)(VRApps *model, NSError *error))block;
- (NSURLSessionTask *)paidMobileAppsWithLimit:(NSUInteger)limit completion:(void(^)(VRApps *model, NSError *error))block;
- (NSURLSessionTask *)freeBooksWithLimit:(NSUInteger)limit completion:(void (^)(VRBooks *, NSError *))block;
- (NSURLSessionTask *)paidBooksWithLimit:(NSUInteger)limit completion:(void (^)(VRBooks *, NSError *))block;
- (NSURLSessionTask *)textbooksWithLimit:(NSUInteger)limit completion:(void (^)(VRBooks *, NSError *))block;

- (NSURLSessionDownloadTask *)downloadFileFromURL:(NSURL *)URL completion:(void(^)(NSString *tempPath, NSString *fileName, NSError *error))block;

@end
