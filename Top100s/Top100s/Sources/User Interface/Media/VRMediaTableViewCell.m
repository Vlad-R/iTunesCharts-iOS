//
//  VRMediaTableViewCell.m
//  Top100s
//
//  Created by Vlad-R on 12/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRMediaTableViewCell.h"

#import "VREntryAdapter.h"
#import "VRIcon.h"
#import "VRImageView.h"
#import "VRPrice.h"

@interface VRMediaTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *orderNumberLabel;
@property (nonatomic, weak) IBOutlet VRImageView *iconImageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *categoryLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;

@end

@implementation VRMediaTableViewCell

#pragma mark - Accessors

- (void)setOrderNumber:(NSUInteger)orderNumber {
    if (_orderNumber != orderNumber) {
        _orderNumber = orderNumber;
        
        self.orderNumberLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)_orderNumber];
    }
}

- (void)setModel:(VREntryAdapter *)model {
    if (_model != model) {
        _model = model;
        
        [self.iconImageView cancelRequests];
        [self.iconImageView loadImageFromURL:[(VRIcon *)_model.icons[2] URL]];
        self.nameLabel.text = _model.name;
        self.categoryLabel.text = _model.category;
        self.priceLabel.text = _model.price;
    }
}

@end
