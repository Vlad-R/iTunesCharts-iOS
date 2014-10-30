//
//  VRHomeViewModel.h
//  Top100s
//
//  Created by Vlad-R on 10/30/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import Foundation;

@class VRApps;

@interface VRHomeViewModel : NSObject

@property (nonatomic, strong) VRApps *model;

- (void)fetchModel:(void(^)())completion;

@end
