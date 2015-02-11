//
//  VRRequestPool.h
//  Top100s
//
//  Created by Vlad-R on 20/01/15.
//  Copyright (c) 2015 Vlad-R. All rights reserved.
//

@import Foundation;

@interface VRRequestPool : NSObject

/**
 Enqueues an NSURLSessionTask in a given queue from the pool.
 
 @param task The task that needs to be enqueued.
 @param identifier A string representing the identity of the queue in which the task needs to be enqueued.
 */
- (void)enqueueTask:(NSURLSessionTask *)task withIdentifier:(NSString *)identifier;

/**
 Cancels and dequeues all NSURLSessionTask objects from a given queue.
 
 @param identifier A string representing the identity of the queue from which all the tasks need to be cancelled and dequeued.
 */
- (void)cancelTasksWithIdentifier:(NSString *)identifier;

/**
 Cancels and dequeues all NSURLSessionTask objects from the pool.
 */
- (void)cancelAllTasks;

@end
