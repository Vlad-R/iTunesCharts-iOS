//
//  VRListViewController.m
//  Top100s
//
//  Created by Vlad-R on 04/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRListViewController.h"

#import "VRListViewModel.h"

@implementation VRListViewController

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"pushList"]) {
        NSString *nextViewModel = sender;
        id viewModel = [[NSClassFromString(nextViewModel) alloc] init];
        [segue.destinationViewController setViewModel:viewModel];
    }
}

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellIdent = @"list_cell_id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdent];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdent];
        cell.textLabel.text = self.viewModel.list[indexPath.row];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *key = self.viewModel.list[indexPath.row];
    NSString *nextViewModel = self.viewModel.viewModelMap[key];
    if (nextViewModel) {
        [self performSegueWithIdentifier:@"pushList" sender:nextViewModel];
    }
}

@end
