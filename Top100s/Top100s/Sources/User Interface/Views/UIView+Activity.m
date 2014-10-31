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
//	[self bringSubviewToFront:self.activityView];
}

@end


@interface VRActivityView ()

@property (nonatomic, strong) UIActivityIndicatorView *spinner;
@property (nonatomic, strong) NSMutableArray *superviewConstraints;

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
	
	self.superviewConstraints = [NSMutableArray array];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
	[self.superview removeConstraints:self.superviewConstraints];
	[self.superviewConstraints removeAllObjects];
}

- (void)didMoveToSuperview {
	if (!self.superview) {
		return;
	}
	
	UIView *view = self;
	UIView *superview = self.superview;
	superview.translatesAutoresizingMaskIntoConstraints = NO;
	NSDictionary *bindings = NSDictionaryOfVariableBindings(view);
	[self.superviewConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"|[view]|" options:0 metrics:nil views:bindings]];
	[self.superviewConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:bindings]];
	[superview addConstraints:self.superviewConstraints];
}

@end
