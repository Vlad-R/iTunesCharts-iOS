//
//  VRMacros.h
//  Top100s
//
//  Created by Vlad-R on 10/27/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#define __FILE_NAME__ [[NSString stringWithFormat:@"%s", __FILE__] lastPathComponent]

#define ASSERT_MISSING_OVERRIDE_IMPLEMENTATION NSAssert(NO, @"Need to override implementation in %@ at line %d", __FILE_NAME__, __LINE__)

#define PROPERTY(property) NSStringFromSelector(@selector(property))
#define CLASS(c) NSStringFromClass([c class])

#define pmap(keys, property) JSON_KEYPATH(keys):PROPERTY(property)
#define transform(property, cls) PROPERTY(property):CLASS(cls)
