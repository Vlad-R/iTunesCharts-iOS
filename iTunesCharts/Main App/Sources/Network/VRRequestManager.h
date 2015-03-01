//
//  VRRequestManager.h
//  iTunesCharts
//
//  Created by Vlad-R on 23/10/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import Foundation;

@class VRRequest;

@interface VRRequestManager : NSObject

/**
 Bridges a VRRequest to an NSURLRequest.
 
 @param request The VRRequest object containing the request's details.
 @return An NSURLRequest configured for a given VRRequest.
 */
+ (NSURLRequest *)foundationRequestFromRequest:(VRRequest *)request;

@end
