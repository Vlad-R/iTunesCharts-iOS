//
//  VRPrice.h
//  Top100s
//
//  Created by Vlad-R on 10/28/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRModel.h"

@interface VRPrice : NSObject <VRModel>

@property (nonatomic, copy) NSString *label;
@property (nonatomic, copy) NSString *amount;
@property (nonatomic, copy) NSString *currency;

@end
