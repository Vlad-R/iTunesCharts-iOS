//
//  VRBooks.m
//  Top100s
//
//  Created by Vlad-R on 21/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRBooks.h"

#import "VRBookEntry.h"


@implementation VRBooks

- (NSDictionary *)transformablePropertyMap {
    return @{ transform(entries, VRBookEntry) };
}

@end


@implementation VRBooksRequest

- (Class)responseModelClass {
    return [VRBooks class];
}

@end


@implementation VRFreeBooksRequest

- (NSString *)endpoint {
    return @"/topfreeebooks";
}

@end


@implementation VRPaidBooksRequest

- (NSString *)endpoint {
    return @"/toppaidebooks";
}

@end


@implementation VRTextbooksRequest

- (NSString *)endpoint {
    return @"/toptextbooks";
}

@end
