//
//  VRBookEntry.h
//  iTunesCharts
//
//  Created by Vlad-R on 12/01/15.
//  Copyright (c) 2015 Vlad-R. All rights reserved.
//

#import "VRModel.h"

@class VRPrice;

@interface VRBookEntry : NSObject <NSCopying, VRModel>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *artist;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *vendor;
@property (nonatomic, copy) NSArray *icons;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) VRPrice *price;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSString *releaseDate;

@end
