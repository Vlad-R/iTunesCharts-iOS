//
//  VRRequestPool.m
//  Top100s
//
//  Created by Vlad-R on 20/01/15.
//  Copyright (c) 2015 Vlad-R. All rights reserved.
//

#import "VRRequestPool.h"

@interface VRRequestPool ()

@property (nonatomic, strong) NSMutableDictionary *requestDictionary;

@end

@implementation VRRequestPool

- (instancetype)init {
    self = [super init];
    if (self) {
        self.requestDictionary = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)enqueueTask:(NSURLSessionTask *)task withIdentifier:(NSString *)identifier {
    if (!task || !identifier) {
        return;
    }
    NSHashTable *tasks = self.requestDictionary[identifier];
    if (!tasks) {
        tasks = [NSHashTable weakObjectsHashTable];
        self.requestDictionary[identifier] = tasks;
    }
    [tasks addObject:task];
}

- (void)cancelTasksWithIdentifier:(NSString *)identifier {
    NSHashTable *tasks = self.requestDictionary[identifier];
    [tasks.allObjects makeObjectsPerformSelector:@selector(cancel)];
    [self.requestDictionary removeObjectForKey:identifier];
}

- (void)cancelAllTasks {
    for (NSHashTable *ht in self.requestDictionary.allValues) {
        [ht.allObjects makeObjectsPerformSelector:@selector(cancel)];
    }
    [self.requestDictionary removeAllObjects];
}

@end
