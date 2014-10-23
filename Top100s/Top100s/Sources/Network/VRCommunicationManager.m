//
//  VRCommunicationManager.m
//  Top100s
//
//  Created by Vlad-R on 10/21/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRCommunicationManager.h"

#import "VRDataParser.h"
#import "VRRequest.h"
#import "VRRequestManager.h"
#import "VRTopFreeApplicationsList.h"

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

#pragma mark - Public

- (NSURLSessionDataTask *)freeMobileAppsWithLimit:(NSUInteger)limit completion:(void(^)(id response, NSError *error))block {
	VRTopFreeApplicationsList *list = [[VRTopFreeApplicationsList alloc] init];
	list.limit = [NSString stringWithFormat:@"%lu", limit];
	
	return [self dataTaskWithRequest:list completion:block];
}

#pragma mark - Private

- (NSURLSessionDataTask *)dataTaskWithRequest:(VRRequest *)request completion:(void(^)(id response, NSError *error))block {
	if (!block) {
		return nil;
	}
	
	NSURLRequest *req = [VRRequestManager URLRequest:request];
	NSURLSessionDataTask *task = [self.session dataTaskWithRequest:req
												 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
													 if (error) {
														 //TODO: Proper Error Handling
														 block(nil, error);
													 } else {
														 block([VRDataParser objectFromJSONData:data], error);
													 }
												 }];
	[task resume];
	
	return task;
}

@end
