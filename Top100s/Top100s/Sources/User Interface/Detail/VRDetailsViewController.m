//
//  VRDetailsViewController.m
//  Top100s
//
//  Created by Vlad-R on 16/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRDetailsViewController.h"

#import "VREntry.h"
#import "VRIcon.h"
#import "VRImageView.h"
#import "VRPrice.h"

@interface VRDetailsViewController ()

@property (nonatomic, weak) IBOutlet VRImageView *imageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *developerLabel;
@property (nonatomic, weak) IBOutlet UILabel *categoryLabel;
@property (nonatomic, weak) IBOutlet UIButton *buyButton;
@property (nonatomic, weak) IBOutlet UITextView *summaryTextView;

@end

@implementation VRDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.entry.name;
    self.navigationItem.leftBarButtonItem = self.navigationController.splitViewController.displayModeButtonItem;
    self.navigationItem.leftItemsSupplementBackButton = YES;
    
    [self.imageView loadImageFromURL:[(VRIcon *)self.entry.icons[2] URL]];
    self.nameLabel.text = self.entry.name;
    self.developerLabel.text = self.entry.artist;
    self.categoryLabel.text = self.entry.category;
    [self.buyButton setTitle:self.entry.price.label forState:UIControlStateNormal];
    self.summaryTextView.text = self.entry.summary;
}

#pragma mark - Actions

- (IBAction)buyButtonTapped:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.entry.link]];
}

@end
