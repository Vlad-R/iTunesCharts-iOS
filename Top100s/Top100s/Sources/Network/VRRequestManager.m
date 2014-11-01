//
//  VRRequestManager.m
//  Top100s
//
//  Created by Vlad-R on 23/10/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRRequestManager.h"

#import "VRDataParser.h"
#import "VRRequest.h"

@implementation VRRequestManager

#pragma mark - Public

+ (NSURLRequest *)URLRequest:(VRRequest *)request {
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", [request host], [request endpoint]];
    NSString *parameters = [VRDataParser parametersForRequest:request];
    
    switch ([request type]) {
        case VRRequestTypeGET: {
            url = [url stringByAppendingFormat:@"%@/json", parameters];
            break;
        }
        case VRRequestTypePOST: {
            // no need for this at the moment
            break;
        }
            
        default: {
            break;
        }
    }
    
    urlRequest.URL = [NSURL URLWithString:url];
    
    return urlRequest;
}

@end
