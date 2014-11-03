//
//  VRNetworkActivityManager.m
//  Top100s
//
//  Created by Vlad-R on 02/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRNetworkActivityManager.h"

@interface VRNetworkActivityManager ()

@property (atomic, assign) NSUInteger runningTaskCount;

@end

@implementation VRNetworkActivityManager

+ (VRNetworkActivityManager *)sharedManager {
    static VRNetworkActivityManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addObserver:self
               forKeyPath:PROPERTY(runningTaskCount)
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:NULL];
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:PROPERTY(runningTaskCount)];
}

#pragma mark - Accessors

- (BOOL)isNetworkActive {
    return self.runningTaskCount;
}

#pragma mark - Public

- (void)observeURLSessionTask:(NSURLSessionTask *)task {
    [task addObserver:self
           forKeyPath:PROPERTY(state)
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:NULL];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    //iOS 8 issue: this method gets called multiple times on single value change
    id oldValue = change[NSKeyValueChangeOldKey];
    id newValue = change[NSKeyValueChangeNewKey];
    if ([newValue isEqual:oldValue]) {
        return;
    }
    
    if ([keyPath isEqualToString:PROPERTY(state)]) {
        NSURLSessionTask *task = object;
        switch (task.state) {
            case NSURLSessionTaskStateRunning: {
                ++self.runningTaskCount;
                break;
            }
            case NSURLSessionTaskStateSuspended: {
                --self.runningTaskCount;
                break;
            }
            case NSURLSessionTaskStateCanceling:
            case NSURLSessionTaskStateCompleted: {
                --self.runningTaskCount;
                [task removeObserver:self forKeyPath:PROPERTY(state)];
                break;
            }
                
            default:
                break;
        }
        
    } else if ([keyPath isEqualToString:PROPERTY(runningTaskCount)]) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = self.networkActive;
        
    } else {
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
}

@end
