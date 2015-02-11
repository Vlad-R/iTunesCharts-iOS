//
//  VRDataParser.h
//  Top100s
//
//  Created by Vlad-R on 10/23/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRModel.h"

@class VRRequest;

@interface VRDataParser : NSObject

/**
 Serializes json data into corresponding model objects.
 
 @param data Raw json data.
 @param request The VRRequest object for which a model should be created.
 @return A model object corresponding to the VRRequest.
 */
+ (id<VRModel>)parseResponseData:(NSData *)data forRequest:(VRRequest *)request;

/**
 Creates a string with the HTTP parameters of a VRRequest object.
 
 @param request The VRRequest object from which the parameters will be extracted.
 @return A string with the corresponding parameters formatted and concatenated.
 */
+ (NSString *)parametersForRequest:(VRRequest *)request;

@end
