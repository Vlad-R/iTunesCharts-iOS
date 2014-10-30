//
//  VRHomeViewController.m
//  Top100s
//
//  Created by Vlad-R on 10/30/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRHomeViewController.h"

#import "VRApps.h"
#import "VREntry.h"
#import "VRHomeTableViewCell.h"
#import "VRHomeViewModel.h"

static NSString *kHomeCellID = @"home_cell_id";

@interface VRHomeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) VRHomeViewModel *viewModel;

@end

@implementation VRHomeViewController

- (void)awakeFromNib {
	self.viewModel = [[VRHomeViewModel alloc] init];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	__weak typeof(self) weakSelf = self;
	[self.viewModel fetchModel:^{
		dispatch_async(dispatch_get_main_queue(), ^{
			[weakSelf.tableView reloadData];
		});
	}];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.viewModel.model.entries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	VREntry *entry = self.viewModel.model.entries[indexPath.row];
	
	VRHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kHomeCellID];
	
	cell.title = entry.title;
	
	return cell;
}

@end
