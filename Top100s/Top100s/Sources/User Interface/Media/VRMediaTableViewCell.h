//
//  VRMediaTableViewCell.h
//  Top100s
//
//  Created by Vlad-R on 12/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import UIKit;

@class VREntry;

@interface VRMediaTableViewCell : UITableViewCell

@property (nonatomic, assign) NSUInteger orderNumber;
@property (nonatomic, strong) VREntry *entry;

@end
