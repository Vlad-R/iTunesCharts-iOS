//
//  VRCommunicationManager.m
//  Top100s
//
//  Created by Vlad-R on 10/21/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRCommunicationManager.h"

#import "VRApps.h"
#import "VRBooks.h"
#import "VRDataParser.h"
#import "VRNetworkActivityManager.h"
#import "VRRequest.h"
#import "VRRequestManager.h"

typedef NS_ENUM(NSInteger, VRFeedType) {
    VRFeedTypeFreeBooks = 0,
    VRFeedTypePaidBooks,
    VRFeedTypeTextbooks,
    VRFeedTypeFreeMobileApps,
    VRFeedTypePaidMobileApps,
    VRFeedTypeFreeMacApps,
    VRFeedTypePaidMacApps
};

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
        sessionConfig.timeoutIntervalForRequest = 60.0;
        
		self.session = [NSURLSession sessionWithConfiguration:sessionConfig
													 delegate:nil
												delegateQueue:self.operationQueue];
	}
	return self;
}

#pragma mark - Public

- (NSURLSessionTask *)freeBooksWithLimit:(NSUInteger)limit completion:(void (^)(VRBooks *, NSError *))block {
    return [self feedWithType:VRFeedTypeFreeBooks limit:limit completion:block];
}

- (NSURLSessionTask *)paidBooksWithLimit:(NSUInteger)limit completion:(void (^)(VRBooks *, NSError *))block {
    return [self feedWithType:VRFeedTypePaidBooks limit:limit completion:block];
}

- (NSURLSessionTask *)textbooksWithLimit:(NSUInteger)limit completion:(void (^)(VRBooks *, NSError *))block {
    return [self feedWithType:VRFeedTypeTextbooks limit:limit completion:block];
}

- (NSURLSessionTask *)freeMobileAppsWithLimit:(NSUInteger)limit completion:(void(^)(VRApps *, NSError *))block {
    return [self feedWithType:VRFeedTypeFreeMobileApps limit:limit completion:block];
}

- (NSURLSessionTask *)paidMobileAppsWithLimit:(NSUInteger)limit completion:(void (^)(VRApps *, NSError *))block {
    return [self feedWithType:VRFeedTypePaidMobileApps limit:limit completion:block];
}

- (NSURLSessionTask *)freeMacAppsWithLimit:(NSUInteger)limit completion:(void(^)(VRApps *, NSError *))block {
    return [self feedWithType:VRFeedTypeFreeMacApps limit:limit completion:block];
}

- (NSURLSessionTask *)paidMacAppsWithLimit:(NSUInteger)limit completion:(void (^)(VRApps *, NSError *))block {
    return [self feedWithType:VRFeedTypePaidMacApps limit:limit completion:block];
}

- (NSURLSessionDownloadTask *)downloadFileFromURL:(NSURL *)URL completion:(void(^)(NSString *tempPath, NSString *fileName, NSError *error))block {
    if (!block) {
        return nil;
    }
    
    NSURLSessionDownloadTask *task = [self.session downloadTaskWithURL:URL
                                                     completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                                         block(location.path, NAME_FOR_URL(URL.absoluteString), error);
                                                     }];
    [[VRNetworkActivityManager sharedManager] observeURLSessionTask:task];
    [task resume];
    
    return task;
}

#pragma mark - Private

- (NSURLSessionTask *)feedWithType:(VRFeedType)type limit:(NSUInteger)limit completion:(void (^)(id, NSError *))block {
    Class requestClass = [self classForFeedType:type];
    id req = [[requestClass alloc] init];
    [req setLimit:[NSString stringWithFormat:@"%lu", limit]];
    
    return [self dataTaskWithRequest:req completion:block];
}

- (Class)classForFeedType:(VRFeedType)type {
    switch (type) {
        case VRFeedTypeFreeBooks:
            return [VRFreeBooksRequest class];
        case VRFeedTypePaidBooks:
            return [VRPaidBooksRequest class];
        case VRFeedTypeTextbooks:
            return [VRTextbooksRequest class];
        case VRFeedTypeFreeMobileApps:
            return [VRFreeMobileAppsRequest class];
        case VRFeedTypePaidMobileApps:
            return [VRPaidMobileAppsRequest class];
        case VRFeedTypeFreeMacApps:
            return [VRFreeMacAppsRequest class];
        case VRFeedTypePaidMacApps:
            return [VRPaidMacAppsRequest class];
            
        default:
            return nil;
    }
}

- (NSURLSessionDataTask *)dataTaskWithRequest:(VRRequest *)request completion:(void(^)(id<VRModel> response, NSError *error))block {
	if (!block) {
		return nil;
	}
	
	NSURLRequest *req = [VRRequestManager foundationRequestFromRequest:request];
	NSURLSessionDataTask *task = [self.session dataTaskWithRequest:req
												 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
													 if (error) {
														 block(nil, error);
													 } else {
                                                         id<VRModel> model = [VRDataParser parseResponseData:data forRequest:request];
														 block(model, error);
													 }
												 }];
    [[VRNetworkActivityManager sharedManager] observeURLSessionTask:task];
	[task resume];
    
	return task;
}

@end
