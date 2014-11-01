//
//  SingletonSpec.m
//  CVKInjector
//
//  Created by Romans Karpelcevs on 21/10/14.
//  Copyright 2014 Romans Karpelcevs. All rights reserved.
//

#import "SharedBehaviors.h"

SharedExamplesBegin(Singleton)

sharedExamplesFor(@"singleton", ^(NSDictionary *data) {
    id (^object)(NSDictionary *) = ^id (NSDictionary *data) {
        return data[kSharedBehaviorObjectKey];
    };
    SEL (^selector)(NSDictionary *) = ^SEL (NSDictionary *data) {
        return NSSelectorFromString(data[kSharedBehaviorMethodKey]);
    };
    id (^resultOfMethod)(NSDictionary *) = ^id (NSDictionary *data) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [object(data) performSelector:selector(data) withObject:nil];
#pragma clang diagnostic pop
    };

    beforeAll(^{
        expect(object(data)).notTo.beNil();
        expect(data[kSharedBehaviorMethodKey]).notTo.beNil();
    });

    it(@"should respond to passed method", ^{
        expect([object(data) respondsToSelector:selector(data)]).to.beTruthy();
    });
    it(@"should return an obejct for method", ^{
        expect(resultOfMethod(data)).notTo.beNil();
    });
    it(@"should return an object of own class from a method", ^{
        expect(resultOfMethod(data)).to.beKindOf(object(data));
    });
    it(@"should return same object for many calls", ^{
        expect(resultOfMethod(data) == resultOfMethod(data)).to.beTruthy();
    });
    it(@"should return another object from init", ^{
        expect(resultOfMethod(data) == [[object(data) alloc] init]).to.beFalsy();
    });
});

SharedExamplesEnd
