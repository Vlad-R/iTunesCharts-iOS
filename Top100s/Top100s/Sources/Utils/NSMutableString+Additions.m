//
//  NSMutableString+Additions.m
//  Top100s
//
//  Created by Vlad-R on 22/10/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "NSMutableString+Additions.h"

@implementation NSMutableString (Additions)

- (void)addParameter:(NSString *)parameter forKey:(NSString *)key {
    [self appendFormat:@"/%@=%@", key, parameter];
}

@end
