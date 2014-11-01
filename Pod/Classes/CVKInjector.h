//
//  CVKInjector.h
//  CVKInjector
//
//  Created by Romans Karpelcevs on 21/10/14.
//  Copyright (c) 2014 Romans Karpelcevs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CVKInjector : NSObject

+ (instancetype)injector;
- (void)registerClass:(Class)injectableClass;
- (void)registerClass:(Class)injectableClass asSingleton:(BOOL)asSingleton;
- (id)objectForInterface:(Protocol *)protocol;

@end
