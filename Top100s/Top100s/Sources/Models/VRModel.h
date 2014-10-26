//
//  VRModel.h
//  Top100s
//
//  Created by Vlad-R on 10/24/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import Foundation;

@protocol VRModel <NSObject>

@required
- (NSDictionary *)responseMap;

@optional
- (NSString *)jsonInitializationKey;
- (NSDictionary *)transformablePropertyMap;

@end
