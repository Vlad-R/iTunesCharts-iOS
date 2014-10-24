//
//  VRRequest.h
//  Top100s
//
//  Created by Vlad-R on 10/21/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import Foundation;

typedef enum {
	VRRequestTypeGET = 0,
	VRRequestTypePOST
} VRRequestType;

@interface VRRequest : NSObject

- (NSString *)host;

//Override in subclasses
- (VRRequestType)type;
- (NSString *)endpoint;
- (NSDictionary *)parameterMap;
- (Class)responseModelClass;

@end
