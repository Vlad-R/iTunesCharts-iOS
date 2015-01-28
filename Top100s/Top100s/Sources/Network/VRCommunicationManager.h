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

/**
 Creates a singleton instance of the class.
 */
+ (instancetype)sharedManager;

/**
 Cancels all active requests for a given sender.
 
 @param sender The object for which the requests need to be cancelled.
 */
- (void)cancelAllRequestsForSender:(NSObject *)sender;

// List Requests
- (void)freeBooksWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void (^)(VRBooks *, NSError *))block;
- (void)paidBooksWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void (^)(VRBooks *, NSError *))block;
- (void)textbooksWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void (^)(VRBooks *, NSError *))block;
- (void)freeMobileAppsWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void(^)(VRApps *model, NSError *error))block;
- (void)paidMobileAppsWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void(^)(VRApps *model, NSError *error))block;
- (void)freeMacAppsWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void(^)(VRApps *, NSError *))block;
- (void)paidMacAppsWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void (^)(VRApps *, NSError *))block;

/**
 Downloads a file and saves it to a temporary path.
 
 @param URL The URL from which the file needs to be downloaded.
 @param sender The object from which this method is called.
 @param block The block that will get called when the operation is finished.
 */
- (void)downloadFileFromURL:(NSURL *)URL sender:(NSObject *)sender completion:(void(^)(NSString *tempPath, NSError *error))block;

@end
