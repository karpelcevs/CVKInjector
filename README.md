# CVKInjector

[![CI Status](http://img.shields.io/travis/coverback/CVKInjector.svg?style=flat)](https://travis-ci.org/coverback/CVKInjector)
[![Version](https://img.shields.io/cocoapods/v/CVKInjector.svg?style=flat)](http://cocoadocs.org/docsets/CVKInjector)
[![License](https://img.shields.io/cocoapods/l/CVKInjector.svg?style=flat)](http://cocoadocs.org/docsets/CVKInjector)
[![Platform](https://img.shields.io/cocoapods/p/CVKInjector.svg?style=flat)](http://cocoadocs.org/docsets/CVKInjector)

CVKInjector is a simple dependency injection helper for Objective-C. All you have to do is register
a class with the injector, and then request an object by interface from the place you need it.

No fancy macros, no additional syntax, no auto-injected Spring-like stuff. Plain, clean Objective-C
which is understandable by anyone.

### Why would I need this?

Relying on interfaces instead of concrete implementations helps better design and testing. For example, controller does not need to know which data source it is using, whether it is network, database or a mock.

Passing concrete instances into initialisers is not always possible, and it can bloat inits with many objects. Dependency injection provides a clean way to decouple classes in the project.

## Usage

#### Registering classes

Use `[CVKInjector instance]` to access singleton injector object.
Register a class with the injector. Any moment before the first object is needed is fine, but one of the easier options is adding registration into `+load` method:

```objective-c
+ (void)load
{
    [[CVKInjector instance] registerClass:self];
}
```

You can also register classes as singletons, this way the same instace will be injected. All classes are constructed using plain `-init`, and it isn't configurable.

#### Injecting dependency

Whenever you need an object implementing some particular protocol, you call `-objectForInterface:` method:
```objective-c
@property (nonatomic) id<ProtocolName> property;

self.property = [[CVKInjector instance] objectForInterface:@protocol(ProtocolName)];
```

User does not know exact class implementation, neither if it is a singleton or a new instance.

## Installation

CVKInjector is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod 'CVKInjector'

## Author

Romans Karpelcevs, karpelcev@gmail.com

## License

CVKInjector is available under the MIT license. See the LICENSE file for more info.

