//
//  VRHomeTableViewCell.m
//  Top100s
//
//  Created by Vlad-R on 10/30/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRHomeTableViewCell.h"

@interface VRHomeTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@end

@implementation VRHomeTableViewCell

- (void)setTitle:(NSString *)title {
	self.titleLabel.text = title;
}

@end
