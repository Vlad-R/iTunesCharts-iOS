//
//  VRMediaTableViewCell.m
//  Top100s
//
//  Created by Vlad-R on 12/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRMediaTableViewCell.h"

#import "VREntry.h"
#import "VRPrice.h"

@interface VRMediaTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *orderNumberLabel;
@property (nonatomic, weak) IBOutlet UIImageView *iconImageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *categoryLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;

@end

@implementation VRMediaTableViewCell

#pragma mark - Accessors

- (void)setOrderNumber:(NSUInteger)orderNumber {
    if (_orderNumber != orderNumber) {
        _orderNumber = orderNumber;
        
        self.orderNumberLabel.text = [NSString stringWithFormat:@"%lu", _orderNumber];
    }
}

- (void)setEntry:(VREntry *)entry {
    if (_entry != entry) {
        _entry = entry;
        
        self.nameLabel.text = _entry.name;
        self.categoryLabel.text = _entry.category;
        self.priceLabel.text = _entry.price.label;
    }
}

@end
