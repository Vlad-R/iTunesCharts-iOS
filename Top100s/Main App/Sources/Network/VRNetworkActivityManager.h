//
//  VRNetworkActivityManager.h
//  Top100s
//
//  Created by Vlad-R on 02/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import Foundation;

/**
 Observes the network activity within the app and displays the Network Activity Indicator whenever necessary.
 */
@interface VRNetworkActivityManager : NSObject

@property (nonatomic, readonly, getter=isNetworkActive) BOOL networkActive;

/**
 Observes the states of NSURLSessionTask objects.
 
 @param task A NSURLSessionTask that needs to be observed.
 */
- (void)observeTask:(NSURLSessionTask *)task;

@end
