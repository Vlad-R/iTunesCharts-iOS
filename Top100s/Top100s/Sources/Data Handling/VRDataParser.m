//
//  VRDataParser.m
//  Top100s
//
//  Created by Vlad-R on 10/23/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRDataParser.h"

#import "VRRequest.h"

@implementation VRDataParser

#pragma mark - Public

+ (id<VRModel>)parseResponseData:(NSData *)data forRequest:(VRRequest *)request {
	NSDictionary *obj = [self objectFromJSONData:data];
	
	if (!obj) {
		return nil;
	}
	
	Class<VRModel> ModelClass = [request responseModelClass];
	id<VRModel> model = [[(Class)ModelClass alloc] init];
	[self parseDictionary:obj forModel:model];
	
	return model;
}

#pragma mark - Private

+ (void)parseDictionary:(NSDictionary *)dictionary forModel:(id<VRModel>)model {
	id obj = [dictionary copy];
	
	if ([model respondsToSelector:@selector(jsonInitializationKey)]) {
		NSString *jsonInitKey = [model jsonInitializationKey];
		obj = obj[jsonInitKey];
	}
	
	NSDictionary *transformablePropertyMap = nil;
	if ([model respondsToSelector:@selector(transformablePropertyMap)]) {
		transformablePropertyMap = [model transformablePropertyMap];
	}
	
	NSDictionary *responseMap = [model responseMap];
	
	for (NSString *key in responseMap.allKeys) {
		id value = [obj copy];
		
		NSString *property = responseMap[key];
		NSArray *jsonKeysToObject = JSON_KEYS(key);
		for (NSString *iter in jsonKeysToObject) {
			value = value[iter];
		}
		
		NSString *transformablePropertyClassName = transformablePropertyMap[property];
		if (transformablePropertyClassName) {
			Class<VRModel> TransformablePropertyClass = NSClassFromString(transformablePropertyClassName);
			
			if ([value isKindOfClass:[NSArray class]]) {
				NSMutableArray *resultArray = [NSMutableArray array];
				for (id iter in value) {
					id<VRModel> transformableModel = [[(Class)TransformablePropertyClass alloc] init];
					[self parseDictionary:iter forModel:transformableModel];
					[resultArray addObject:transformableModel];
				}
				[(id)model setValue:resultArray forKey:property];
				
			} else {
				id<VRModel> transformableModel = [[(Class)TransformablePropertyClass alloc] init];
				[self parseDictionary:value forModel:transformableModel];
				[(id)model setValue:transformableModel forKey:property];
			}
			
		} else {
			[(id)model setValue:value forKey:property];
		}
	}
}

+ (id)objectFromJSONData:(NSData *)data {
	if (!data) {
		return nil;
	}
	
	NSError *error = nil;
	id obj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
	
	if (error) {
		return nil;
	}
	
	return obj;
}

@end
