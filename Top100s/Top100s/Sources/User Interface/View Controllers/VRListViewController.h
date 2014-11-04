//
//  VRListViewController.h
//  Top100s
//
//  Created by Vlad-R on 04/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import UIKit;

@interface VRListViewController : UITableViewController

@property (nonatomic, strong) NSArray *list;
@property (nonatomic, copy) void(^selectCellAction)(UITableView *, NSIndexPath *);

@end
