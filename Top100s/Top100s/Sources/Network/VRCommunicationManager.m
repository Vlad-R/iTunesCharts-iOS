//
//  VRCommunicationManager.m
//  Top100s
//
//  Created by Vlad-R on 10/21/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRCommunicationManager.h"

#import "VRRequest.h"

@interface VRCommunicationManager ()

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation VRCommunicationManager

+ (instancetype)sharedManager {
	static VRCommunicationManager *sharedInstance = nil;
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance = [[self alloc] init];
	});
	
	return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.operationQueue = [[NSOperationQueue alloc] init];
        self.operationQueue.qualityOfService = NSQualityOfServiceDefault;
        self.operationQueue.maxConcurrentOperationCount = 1;
        
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:sessionConfig
                                                     delegate:nil
                                                delegateQueue:self.operationQueue];
    }
    return self;
}

@end
