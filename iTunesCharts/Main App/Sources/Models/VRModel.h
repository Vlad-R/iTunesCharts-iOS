//
//  VRModel.h
//  iTunesCharts
//
//  Created by Vlad-R on 10/24/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import Foundation;

/**
 The protocol that all response model objects need to conform to.
 */
@protocol VRModel <NSObject>

@required
/**
 Return a dictionary composed of json keys/property name pairs.
 */
- (NSDictionary *)responseMap;

@optional
/**
 If you would like to start the response's parsing from a json nested inside the initial json, then return the key for that json.
 */
- (NSString *)jsonInitializationKey;

/**
 If you would like to transform any nested json, from within the initial json, into an object, add a property name/class name pair to the dictionary returned by this method.
 Note that the object you want to create has to conform to the VRModel protocol.
 */
- (NSDictionary *)transformablePropertyMap;

@end
