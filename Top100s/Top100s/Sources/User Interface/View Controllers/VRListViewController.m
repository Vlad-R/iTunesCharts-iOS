//
//  VRListViewController.m
//  Top100s
//
//  Created by Vlad-R on 04/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRListViewController.h"

@implementation VRListViewController

#pragma mark - Accessors

- (void)setList:(NSArray *)list {
    if (_list != list) {
        _list = list;
        [self.tableView reloadData];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellIdent = @"list_cell_id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdent];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdent];
        cell.textLabel.text = self.list[indexPath.row];
    }
    
    return cell;
}

@end
