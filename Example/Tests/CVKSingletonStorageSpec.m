//
//  SingletonStorageSpec.m
//  CVKInjector
//
//  Created by Romans Karpelcevs on 26/10/14.
//  Copyright 2014 Romans Karpelcevs. All rights reserved.
//

#import "Specta.h"
#import "CVKSingletonStorage.h"

SpecBegin(CVKSingletonStorage)

describe(@"CVKSingletonStorage", ^{
    __block CVKSingletonStorage *storage;
    beforeEach(^{
        storage = [[CVKSingletonStorage alloc] init];
    });

    it(@"should instantiate an object for a class", ^{
        id result = [storage sharedInstanceForClass:[NSObject class]];
        expect(result).notTo.beNil();
    });

    it(@"should return object of the requested class", ^{
        id result = [storage sharedInstanceForClass:[NSObject class]];
        expect(result).to.beKindOf([NSObject class]);
    });

    it(@"should return the same object for many requests", ^{
        id result1 = [storage sharedInstanceForClass:[NSObject class]];
        id result2 = [storage sharedInstanceForClass:[NSObject class]];
        expect(result1).to.beIdenticalTo(result2);
    });
});

SpecEnd
