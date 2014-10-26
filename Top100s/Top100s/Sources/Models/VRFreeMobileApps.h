//
//  VRFreeMobileApps.h
//  Top100s
//
//  Created by Vlad-R on 25/10/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRModel.h"
#import "VRRequest.h"


@interface VRFreeMobileApps : NSObject <VRModel>

@property (nonatomic, copy) NSArray *values;

@end


@interface VRFreeMobileAppsRequest : VRRequest

@property (nonatomic, copy) NSString *limit;

@end
