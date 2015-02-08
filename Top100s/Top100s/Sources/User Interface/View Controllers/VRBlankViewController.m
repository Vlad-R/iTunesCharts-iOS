//
//  VRBlankViewController.m
//  Top100s
//
//  Created by Vlad-R on 07/02/15.
//  Copyright (c) 2015 Vlad-R. All rights reserved.
//

#import "VRBlankViewController.h"

@implementation VRBlankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.navigationController.splitViewController) {
        self.navigationItem.leftBarButtonItem = self.navigationController.splitViewController.displayModeButtonItem;
        self.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

@end
