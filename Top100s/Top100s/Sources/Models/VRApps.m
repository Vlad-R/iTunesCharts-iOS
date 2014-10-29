//
//  VRApps.m
//  Top100s
//
//  Created by Vlad-R on 10/29/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRApps.h"

#import "VREntry.h"


@implementation VRApps

- (NSDictionary *)transformablePropertyMap {
	return @{ transform(entries, VREntry) };
}

@end


@implementation VRAppsRequest

- (Class)responseModelClass {
	return [VRApps class];
}

@end


@implementation VRFreeMobileAppsRequest

- (NSString *)endpoint {
	return @"/topfreeapplications";
}

@end


@implementation VRPaidMobileAppsRequest

- (NSString *)endpoint {
	return @"/toppaidapplications";
}

@end
