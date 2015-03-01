//
//  VRMediaTableViewCell.h
//  iTunesCharts
//
//  Created by Vlad-R on 12/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import UIKit;

@class VREntryAdapter;

@interface VRMediaTableViewCell : UITableViewCell

@property (nonatomic, assign) NSUInteger orderNumber;
@property (nonatomic, strong) VREntryAdapter *model;

@end
