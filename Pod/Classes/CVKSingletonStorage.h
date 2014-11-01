//
//  CVKSingletonStorage.h
//  CVKInjector
//
//  Created by Romans Karpelcevs on 26/10/14.
//  Copyright (c) 2014 Romans Karpelcevs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CVKSingletonStorage : NSObject

- (id)sharedInstanceForClass:(Class)singletonClass;

@end
