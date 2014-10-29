//
//  VRList.h
//  Top100s
//
//  Created by Vlad-R on 10/29/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRModel.h"
#import "VRRequest.h"


@interface VRList : NSObject <VRModel>

@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSArray *entries;

@end


@interface VRListRequest : VRRequest

@property (nonatomic, copy) NSString *limit;

@end
