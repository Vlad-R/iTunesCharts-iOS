//
//  VRMediaViewModel.h
//  iTunesCharts
//
//  Created by Vlad-R on 12/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import UIKit;

@protocol VRMediaViewModel <NSObject>

@property (nonatomic, strong) id model;

- (void)fetchModel:(void(^)())completion;

@end
