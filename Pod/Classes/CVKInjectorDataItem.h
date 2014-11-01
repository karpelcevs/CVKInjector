//
//  CVKInjectorDataItem.h
//  CVKInjector
//
//  Created by Romans Karpelcevs on 25/10/14.
//  Copyright (c) 2014 Romans Karpelcevs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CVKInjectorDataItem : NSObject

@property (nonatomic, readonly) Class injectableClass;
@property (nonatomic, readonly) BOOL singleton;

- (instancetype)initWithClass:(Class)storedClass singleton:(BOOL)singleton;

@end
