//
//  UIView+Activity.h
//  Top100s
//
//  Created by Vlad-R on 10/31/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import UIKit;

@interface UIView (Activity)

/**
 Shows an overlay and a spinner on self when set on YES.
 The user can't interact with self while the overlay is present.
 */
@property (nonatomic, assign) BOOL activityViewVisible;

@end
