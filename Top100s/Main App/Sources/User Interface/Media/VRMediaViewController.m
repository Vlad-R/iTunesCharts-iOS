//
//  VRMediaViewController.m
//  Top100s
//
//  Created by Vlad-R on 11/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRMediaViewController.h"

#import "UIView+Activity.h"
#import "VRApps.h"
#import "VRDetailsViewController.h"
#import "VREntryAdapter.h"
#import "VRMediaTableViewCell.h"

static NSString *kMediaCellID = @"media_cell_id";

@interface VRMediaViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation VRMediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.activityViewVisible = YES;
    __weak typeof(self) weakSelf = self;
    [self.viewModel fetchModel:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
            weakSelf.view.activityViewVisible = NO;
        });
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UINavigationController *navController = segue.destinationViewController;
    id vc = navController.topViewController;
    if ([vc respondsToSelector:@selector(setModel:)]) {
        [vc setModel:sender];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.viewModel.model entries] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VREntryAdapter *adapter = [VREntryAdapter adapterFromObject:[self.viewModel.model entries][indexPath.row]];
    
    VRMediaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMediaCellID];
    cell.orderNumber = indexPath.row + 1;
    cell.model = adapter;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.navigationController.splitViewController.collapsed) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
    VREntryAdapter *adapter = [VREntryAdapter adapterFromObject:[self.viewModel.model entries][indexPath.row]];
    [self performSegueWithIdentifier:@"showDetails" sender:adapter];
}

@end
