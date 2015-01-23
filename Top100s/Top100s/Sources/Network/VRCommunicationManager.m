//
//  VRCommunicationManager.m
//  Top100s
//
//  Created by Vlad-R on 10/21/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRCommunicationManager.h"

#import "NSObject+UUID.h"
#import "VRApps.h"
#import "VRBooks.h"
#import "VRDataParser.h"
#import "VRNetworkActivityManager.h"
#import "VRRequest.h"
#import "VRRequestManager.h"
#import "VRRequestPool.h"

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
@property (nonatomic, strong) VRNetworkActivityManager *networkActivityManager;
@property (nonatomic, strong) VRRequestPool *requestPool;
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
        
        self.networkActivityManager = [[VRNetworkActivityManager alloc] init];
        
        self.requestPool = [[VRRequestPool alloc] init];
	}
    
	return self;
}

#pragma mark - Public

- (void)cancelAllRequestsForSender:(NSObject *)sender {
    [self.requestPool cancelTasksWithIdentifier:sender.uniqueIdentifier];
}

- (void)freeBooksWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void (^)(VRBooks *, NSError *))block {
    [self feedWithType:VRFeedTypeFreeBooks limit:limit requestSender:sender completion:block];
}

- (void)paidBooksWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void (^)(VRBooks *, NSError *))block {
    [self feedWithType:VRFeedTypePaidBooks limit:limit requestSender:sender completion:block];
}

- (void)textbooksWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void (^)(VRBooks *, NSError *))block {
    [self feedWithType:VRFeedTypeTextbooks limit:limit requestSender:sender completion:block];
}

- (void)freeMobileAppsWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void(^)(VRApps *, NSError *))block {
    [self feedWithType:VRFeedTypeFreeMobileApps limit:limit requestSender:sender completion:block];
}

- (void)paidMobileAppsWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void (^)(VRApps *, NSError *))block {
    [self feedWithType:VRFeedTypePaidMobileApps limit:limit requestSender:sender completion:block];
}

- (void)freeMacAppsWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void(^)(VRApps *, NSError *))block {
    [self feedWithType:VRFeedTypeFreeMacApps limit:limit requestSender:sender completion:block];
}

- (void)paidMacAppsWithLimit:(NSUInteger)limit sender:(NSObject *)sender completion:(void (^)(VRApps *, NSError *))block {
    [self feedWithType:VRFeedTypePaidMacApps limit:limit requestSender:sender completion:block];
}

- (NSURLSessionDownloadTask *)downloadFileFromURL:(NSURL *)URL completion:(void(^)(NSString *tempPath, NSString *fileName, NSError *error))block {
    if (!block) {
        return nil;
    }
    
    NSURLSessionDownloadTask *task = [self.session downloadTaskWithURL:URL
                                                     completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                                         block(location.path, NAME_FOR_URL(URL.absoluteString), error);
                                                     }];
    [self.networkActivityManager observeTask:task];
    
    [task resume];
    
    return task;
}

#pragma mark - Private

- (void)feedWithType:(VRFeedType)type limit:(NSUInteger)limit requestSender:(NSObject *)sender completion:(void (^)(id, NSError *))block {
    Class requestClass = [self classForFeedType:type];
    id req = [[requestClass alloc] init];
    [req setLimit:[NSString stringWithFormat:@"%lu", limit]];
    
    NSURLSessionTask *task = [self dataTaskWithRequest:req completion:block];
    [self.requestPool enqueueTask:task withIdentifier:sender.uniqueIdentifier];
    
    [task resume];
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
    
    [self.networkActivityManager observeTask:task];
    
	return task;
}

@end
