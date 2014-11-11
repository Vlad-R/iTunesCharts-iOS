//
//  VRMediaViewModel.h
//  Top100s
//
//  Created by Vlad-R on 12/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import Foundation;

@class VRApps;

@interface VRMediaViewModel : NSObject

@property (nonatomic, strong) VRApps *model;

- (void)fetchModel:(void(^)())completion;

@end
