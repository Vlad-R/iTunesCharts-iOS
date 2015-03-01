//
//  VRObjectAdapter.h
//  iTunesCharts
//
//  Created by Vlad-R on 23/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import Foundation;

@interface VRObjectAdapter : NSObject

@property (nonatomic, copy) id<NSObject, NSCopying> object;

+ (instancetype)adapterFromObject:(id)object;

@end
