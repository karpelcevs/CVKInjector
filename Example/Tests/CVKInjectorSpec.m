//
//  InjectorSpec.m
//  CVKInjector
//
//  Created by Romans Karpelcevs on 21/10/14.
//  Copyright 2014 Romans Karpelcevs. All rights reserved.
//

#import "SharedBehaviors.h"
#import "CVKInjector.h"

SpecBegin(CVKInjector)

describe(@"Injector", ^{
    __block CVKInjector *injector;
    
    beforeEach(^{
        injector = [[CVKInjector alloc] init];
    });

    itShouldBehaveLike(kSharedBehaviorSingleton, @{kSharedBehaviorObjectKey: [CVKInjector class],
                                                   kSharedBehaviorMethodKey: @"injector"});
    
    it(@"should allow registering classes", ^{
        expect(^{ [injector registerClass:[NSObject class]]; }).notTo.raiseAny();
    });

    it(@"should return an object for a registered protocol", ^{
        [injector registerClass:[NSObject class]];
        id result = [injector objectForInterface:@protocol(NSObject)];
        expect(result).notTo.beNil();
    });

    it(@"should return nil for an unregistered protocol", ^{
        [injector registerClass:[NSObject class]];
        id result = [injector objectForInterface:@protocol(NSCopying)];
        expect(result).to.beNil();
    });

    it(@"should return new copies for each request", ^{
        [injector registerClass:[NSObject class]];
        id result1 = [injector objectForInterface:@protocol(NSObject)];
        id result2 = [injector objectForInterface:@protocol(NSObject)];
        expect(result1).notTo.beIdenticalTo(result2);
    });

    it(@"should return last to register class for ambiguous protocols", ^{
        [injector registerClass:[NSString class]];
        [injector registerClass:[NSArray class]];
        id result = [injector objectForInterface:@protocol(NSCopying)];
        expect(result).to.beKindOf([NSArray class]);
    });

    it(@"should allow to class as singleton", ^{
        [injector registerClass:[NSObject class] asSingleton:YES];
        id result = [injector objectForInterface:@protocol(NSObject)];
        expect(result).notTo.beNil();
    });

    it(@"should return same instance for singleton classes", ^{
        [injector registerClass:[NSObject class] asSingleton:YES];
        id result1 = [injector objectForInterface:@protocol(NSObject)];
        id result2 = [injector objectForInterface:@protocol(NSObject)];
        expect(result1).to.beIdenticalTo(result2);
    });
});

SpecEnd
