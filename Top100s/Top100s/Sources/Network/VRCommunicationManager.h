//
//  VRCommunicationManager.h
//  Top100s
//
//  Created by Vlad-R on 10/21/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import Foundation;

@interface VRCommunicationManager : NSObject

+ (instancetype)sharedManager;

- (NSURLSessionDataTask *)freeMobileAppsWithLimit:(NSUInteger)limit completion:(void(^)(id response, NSError *error))block;

@end
