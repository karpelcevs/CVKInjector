//
//  CVKSingletonStorage.m
//  CVKInjector
//
//  Created by Romans Karpelcevs on 26/10/14.
//  Copyright (c) 2014 Romans Karpelcevs. All rights reserved.
//

#import "CVKSingletonStorage.h"

@interface CVKSingletonStorage ()

@property (nonatomic) NSMutableDictionary *storage;

@end

@implementation CVKSingletonStorage

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.storage = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (id)sharedInstanceForClass:(Class)singletonClass
{
    id instance = self.storage[NSStringFromClass(singletonClass)];
    if (!instance) {
        instance = [[singletonClass alloc] init];
        self.storage[NSStringFromClass(singletonClass)] = instance;
    }
    return instance;
}

@end
