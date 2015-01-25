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

- (void)cancelAllRequestsForSender:(NSObject *)sender;

- (void)freeBooksWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void (^)(VRBooks *, NSError *))block;
- (void)paidBooksWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void (^)(VRBooks *, NSError *))block;
- (void)textbooksWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void (^)(VRBooks *, NSError *))block;
- (void)freeMobileAppsWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void(^)(VRApps *model, NSError *error))block;
- (void)paidMobileAppsWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void(^)(VRApps *model, NSError *error))block;
- (void)freeMacAppsWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void(^)(VRApps *, NSError *))block;
- (void)paidMacAppsWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void (^)(VRApps *, NSError *))block;

- (void)downloadFileFromURL:(NSURL *)URL sender:(NSObject *)sender completion:(void(^)(NSString *tempPath, NSError *error))block;

@end
