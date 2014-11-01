//
//  InjectorStorageItemSpec.m
//  CVKInjector
//
//  Created by Romans Karpelcevs on 25/10/14.
//  Copyright 2014 Romans Karpelcevs. All rights reserved.
//

#import "CVKInjectorDataItem.h"

SpecBegin(CVKInjectorStorageItem)

describe(@"CVKInjectorStorageItem", ^{
    it(@"should store data", ^{
        CVKInjectorDataItem *item = [[CVKInjectorDataItem alloc] initWithClass:[NSObject class] singleton:YES];
        expect(item.injectableClass == [NSObject class]).to.beTruthy();
        expect(item.singleton).to.beTruthy();
    });

    it(@"should be equal for equal items", ^{
        CVKInjectorDataItem *item1 = [[CVKInjectorDataItem alloc] initWithClass:[NSObject class] singleton:YES];
        CVKInjectorDataItem *item2 = [[CVKInjectorDataItem alloc] initWithClass:[NSObject class] singleton:YES];
        expect([item1 isEqual:item2]).to.beTruthy();
        expect(item1.hash).to.equal(item2.hash);
    });

    it(@"should not be equal for different classes", ^{
        CVKInjectorDataItem *item1 = [[CVKInjectorDataItem alloc] initWithClass:[NSObject class] singleton:YES];
        CVKInjectorDataItem *item2 = [[CVKInjectorDataItem alloc] initWithClass:[NSString class] singleton:YES];
        expect([item1 isEqual:item2]).to.beFalsy();
        expect(item1.hash).notTo.equal(item2.hash);
    });
    it(@"should not be equal for different booleans", ^{
        CVKInjectorDataItem *item1 = [[CVKInjectorDataItem alloc] initWithClass:[NSObject class] singleton:YES];
        CVKInjectorDataItem *item2 = [[CVKInjectorDataItem alloc] initWithClass:[NSObject class] singleton:NO];
        expect([item1 isEqual:item2]).to.beFalsy();
        expect(item1.hash).notTo.equal(item2.hash);
    });
});

SpecEnd
