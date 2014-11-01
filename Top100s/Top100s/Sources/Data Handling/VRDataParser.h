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

+ (id<VRModel>)parseResponseData:(NSData *)data forRequest:(VRRequest *)request;
+ (NSString *)parametersForRequest:(VRRequest *)request;

@end
