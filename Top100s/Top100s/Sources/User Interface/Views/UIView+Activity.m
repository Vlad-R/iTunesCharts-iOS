//
//  UIView+Activity.m
//  Top100s
//
//  Created by Vlad-R on 10/31/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import ObjectiveC.runtime;

#import "UIView+Activity.h"


static char kActivityViewKey;

@implementation UIView (Activity)

- (VRActivityView *)activityView {
    return objc_getAssociatedObject(self, &kActivityViewKey);
}

- (void)setActivityView:(VRActivityView *)activityView {
    objc_setAssociatedObject(self, &kActivityViewKey, activityView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)activityViewVisible {
    [self setupActivityView];
    return !self.activityView.hidden;
}

- (void)setActivityViewVisible:(BOOL)activityViewVisible {
    [self setupActivityView];
    self.activityView.hidden = !activityViewVisible;
}

#pragma mark - Private

- (void)setupActivityView {
    if (!self.activityView) {
        self.activityView = [[VRActivityView alloc] init];
        [self addSubview:self.activityView];
    }
}

@end


@interface VRActivityView ()

@property (nonatomic, strong) UIActivityIndicatorView *spinner;
@property (nonatomic, strong) NSMutableArray *layoutConstraints;

@end

@implementation VRActivityView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor whiteSemitransparentColor];
    
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.spinner startAnimating];
    [self addSubview:self.spinner];
    
    self.layoutConstraints = [NSMutableArray array];
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.spinner.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [self.superview removeConstraints:self.layoutConstraints];
    [self.layoutConstraints removeAllObjects];
}

- (void)didMoveToSuperview {
    if (!self.superview) {
        return;
    }
    
    UIView *view = self;
    UIView *superview = self.superview;
    NSDictionary *bindings = NSDictionaryOfVariableBindings(view);
    [self.layoutConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"|[view]|"
                                                                                        options:0
                                                                                        metrics:nil
                                                                                          views:bindings]];
    [self.layoutConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|"
                                                                                        options:0
                                                                                        metrics:nil
                                                                                          views:bindings]];
    NSLayoutConstraint *xCenterConstraint = [NSLayoutConstraint constraintWithItem:view
                                                                         attribute:NSLayoutAttributeCenterX
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.spinner
                                                                         attribute:NSLayoutAttributeCenterX
                                                                        multiplier:1.0
                                                                          constant:0];
    [self.layoutConstraints addObject:xCenterConstraint];
    NSLayoutConstraint *yCenterConstraint = [NSLayoutConstraint constraintWithItem:view
                                                                         attribute:NSLayoutAttributeCenterY
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.spinner
                                                                         attribute:NSLayoutAttributeCenterY
                                                                        multiplier:1.0
                                                                          constant:0];
    [self.layoutConstraints addObject:yCenterConstraint];
    
    [superview addConstraints:self.layoutConstraints];
}

@end
