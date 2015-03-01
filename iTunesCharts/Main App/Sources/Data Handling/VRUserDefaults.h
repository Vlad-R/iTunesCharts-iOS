//
//  VRUserDefaults.h
//  iTunesCharts
//
//  Created by Vlad-R on 14/02/15.
//  Copyright (c) 2015 Vlad-R. All rights reserved.
//

@import Foundation;

@interface VRUserDefaults : NSObject

/**
 Gets the number of list items that should be requested.
 This number is retrieved from the Settings Bundle.
 
 @return The number of list items that should be requested.
 */
+ (NSUInteger)settingsBundleNumberOfItemsToRequest;

@end
