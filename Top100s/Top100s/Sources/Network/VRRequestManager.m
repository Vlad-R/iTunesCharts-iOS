//
//  VRRequestManager.m
//  Top100s
//
//  Created by Vlad-R on 23/10/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRRequestManager.h"

#import "NSMutableString+Additions.h"
#import "VRRequest.h"

@implementation VRRequestManager

#pragma mark - Public

+ (NSURLRequest *)URLRequest:(VRRequest *)request {
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", [request host], [request endpoint]];
    NSString *parameters = [self parametersForRequest:request];
    
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

#pragma mark - Private

+ (NSString *)parametersForRequest:(VRRequest *)request {
    NSMutableString *result = [NSMutableString string];
    NSDictionary *parameterMap = [request parameterMap];
    for (NSString *key in parameterMap.allKeys) {
        NSString *value = [request valueForKey:parameterMap[key]];
        [result addParameter:value forKey:key];
    }
    
    return result;
}

@end
