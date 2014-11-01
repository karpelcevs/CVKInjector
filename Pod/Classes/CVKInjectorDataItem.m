//
//  CVKInjectorDataItem.m
//  CVKInjector
//
//  Created by Romans Karpelcevs on 25/10/14.
//  Copyright (c) 2014 Romans Karpelcevs. All rights reserved.
//

#import "CVKInjectorDataItem.h"

@interface CVKInjectorDataItem ()

@property (nonatomic, readwrite) Class injectableClass;
@property (nonatomic, readwrite) BOOL singleton;

@end

@implementation CVKInjectorDataItem

- (instancetype)initWithClass:(Class)storedClass singleton:(BOOL)asSingleton
{
    self = [super init];
    if (self) {
        _injectableClass = storedClass;
        _singleton = asSingleton;
    }
    return self;
}

- (BOOL)isEqual:(id)object
{
    if (self == object)
        return YES;

    if (![object isKindOfClass:[CVKInjectorDataItem class]])
        return NO;

    return [self isEqualToInjectorStorageItem:object];
}

- (BOOL)isEqualToInjectorStorageItem:(CVKInjectorDataItem *)object
{
    return self.injectableClass == object.injectableClass
        && self.singleton == object.singleton;
}

- (NSUInteger)hash
{
    return (NSUInteger)self.injectableClass ^ self.singleton;
}

@end
