//
//  VRRequestObject.h
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

@interface VRRequestObject : NSObject

@property (nonatomic, assign) VRRequestType type;

@property (nonatomic, copy) NSString *limit;

- (NSString *)endpoint;
- (NSDictionary *)parameterMap;

@end
