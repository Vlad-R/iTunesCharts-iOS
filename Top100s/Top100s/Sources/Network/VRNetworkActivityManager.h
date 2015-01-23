//
//  VRNetworkActivityManager.h
//  Top100s
//
//  Created by Vlad-R on 02/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import Foundation;

@interface VRNetworkActivityManager : NSObject

@property (nonatomic, readonly, getter=isNetworkActive) BOOL networkActive;

- (void)observeTask:(NSURLSessionTask *)task;

@end
