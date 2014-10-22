//
//  VRRequestManager.h
//  Top100s
//
//  Created by Vlad-R on 23/10/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import Foundation;

@class VRRequest;

@interface VRRequestManager : NSObject

+ (NSURLRequest *)URLRequest:(VRRequest *)request;

@end
