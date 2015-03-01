//
//  VRMacros.h
//  iTunesCharts
//
//  Created by Vlad-R on 10/27/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#ifndef VRMacros_Header
#define VRMacros_Header


#define __FILE_NAME__ [[NSString stringWithFormat:@"%s", __FILE__] lastPathComponent]

#define ASSERT_MISSING_OVERRIDE_IMPLEMENTATION NSAssert(NO, @"In class %@, you need to override function %s, from %@, at line %d.", CLASS(self), __func__, __FILE_NAME__, __LINE__)

#define PROPERTY(property) NSStringFromSelector(@selector(property))
#define CLASS(c) NSStringFromClass([c class])

#define pmap(keys, property) json_keypath(keys):PROPERTY(property)
#define transform(property, cls) PROPERTY(property):CLASS(cls)

#define ClassMap(key, cls) key: CLASS(cls)


#endif
