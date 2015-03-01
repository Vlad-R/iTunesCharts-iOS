//
//  VRIcon.h
//  iTunesCharts
//
//  Created by Vlad-R on 10/28/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRModel.h"

@interface VRIcon : NSObject <NSCopying, VRModel>

@property (nonatomic, copy) NSString *URL;
@property (nonatomic, copy) NSString *height;

@end
