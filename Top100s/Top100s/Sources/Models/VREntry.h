//
//  VREntry.h
//  Top100s
//
//  Created by Vlad-R on 26/10/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRModel.h"

@class VRPrice;

@interface VREntry : NSObject <VRModel>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *artist;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSArray *icons;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, strong) VRPrice *price;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSString *releaseDate;

@end
