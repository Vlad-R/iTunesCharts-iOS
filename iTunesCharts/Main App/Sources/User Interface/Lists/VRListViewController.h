//
//  VRListViewController.h
//  iTunesCharts
//
//  Created by Vlad-R on 04/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import UIKit;

@class VRListViewModel;

@interface VRListViewController : UITableViewController

@property (nonatomic, strong) VRListViewModel *viewModel;

@end
