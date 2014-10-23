//
//  VRDataParser.h
//  Top100s
//
//  Created by Vlad-R on 10/23/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import Foundation;

@interface VRDataParser : NSObject

+ (id)objectFromJSONData:(NSData *)data;

@end
