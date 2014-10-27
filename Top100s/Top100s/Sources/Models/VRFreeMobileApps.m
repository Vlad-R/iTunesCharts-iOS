//
//  VRFreeMobileApps.m
//  Top100s
//
//  Created by Vlad-R on 25/10/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRFreeMobileApps.h"

#import "VREntry.h"


@implementation VRFreeMobileApps

- (NSString *)jsonInitializationKey {
    return @"feed";
}

- (NSDictionary *)responseMap {
	return @{ pmap((@[ @"author", @"name", @"label" ]), author),
			  pmap(@[ @"entry" ], entries) };
}

- (NSDictionary *)transformablePropertyMap {
    return @{ transform(entries, VREntry) };
}

@end


@implementation VRFreeMobileAppsRequest

- (NSString *)endpoint {
    return @"/topfreeapplications";
}

- (NSDictionary *)parameterMap {
    return @{ pmap(@[ @"limit" ], limit) };
}

- (Class)responseModelClass {
    return [VRFreeMobileApps class];
}

@end
