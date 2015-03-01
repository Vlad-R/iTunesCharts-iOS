//
//  VRApps.h
//  iTunesCharts
//
//  Created by Vlad-R on 10/29/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRList.h"


@interface VRApps : VRList
@end


@interface VRAppsRequest : VRListRequest
@end


@interface VRFreeMobileAppsRequest : VRAppsRequest
@end


@interface VRPaidMobileAppsRequest : VRAppsRequest
@end


@interface VRFreeMacAppsRequest : VRAppsRequest
@end


@interface VRPaidMacAppsRequest : VRAppsRequest
@end
