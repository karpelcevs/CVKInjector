//
//  CVKInjector.m
//  CVKInjector
//
//  Created by Romans Karpelcevs on 21/10/14.
//  Copyright (c) 2014 Romans Karpelcevs. All rights reserved.
//

#import "CVKInjector.h"
#import "CVKInjectorDataItem.h"
#import "CVKSingletonStorage.h"

@interface CVKInjector ()

@property (nonatomic) NSMutableArray *registeredClasses;
@property (nonatomic) CVKSingletonStorage *storage;

@end

@implementation CVKInjector

- (instancetype)init
{
    self = [super init];
    if (self) {
        _registeredClasses = [[NSMutableArray alloc] init];
        _storage = [[CVKSingletonStorage alloc] init];
    }
    return self;
}

- (void)registerClass:(Class)injectableClass
{
    [self registerClass:injectableClass asSingleton:NO];
}

- (void)registerClass:(Class)injectableClass asSingleton:(BOOL)asSingleton
{
    CVKInjectorDataItem *newItem = [[CVKInjectorDataItem alloc] initWithClass:injectableClass
                                                                    singleton:asSingleton];
    if (![self.registeredClasses containsObject:newItem])
        [self.registeredClasses addObject:newItem];
}

- (id)objectForInterface:(Protocol *)protocol
{
    NSEnumerator *reverseEnumerator = [self.registeredClasses reverseObjectEnumerator];
    for (CVKInjectorDataItem *item in reverseEnumerator) {
        if ([item.injectableClass conformsToProtocol:protocol]) {
            if (item.singleton) {
                return [self.storage sharedInstanceForClass:item.injectableClass];
            } else {
                return [[item.injectableClass alloc] init];
            }
        }
    }
    return nil;
}

+ (instancetype)instance
{
    static CVKInjector *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });

    return _instance;
}

@end
