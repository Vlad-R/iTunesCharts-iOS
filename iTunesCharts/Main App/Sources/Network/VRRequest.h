//
//  VRRequest.h
//  iTunesCharts
//
//  Created by Vlad-R on 10/21/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRModel.h"

typedef NS_ENUM(NSInteger, VRRequestType) {
	VRRequestTypeGET = 0,
	VRRequestTypePOST
};

@interface VRRequest : NSObject

- (NSString *)host;

//Override in subclasses
- (VRRequestType)type;
- (NSString *)endpoint;
- (NSDictionary *)parameterMap; //return a dictionary containing json keys/property name pairs
- (Class<VRModel>)responseModelClass; //return the class for the response object

@end
