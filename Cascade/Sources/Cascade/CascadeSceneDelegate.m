//
//  CascadeSceneDelegate.m
//  
//
//  Created by dDomovoj on 6/21/22.
//

#import "CascadeSceneDelegate.h"

@implementation CascadeSceneDelegate

- (NSArray<id<UISceneDelegate>>*)targets {
  return @[];
}

@end

@implementation CascadeSceneDelegate (Proxy)

+ (BOOL)instancesRespondToSelector:(SEL)aSelector {
  return YES;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
  for (UIResponder<UISceneDelegate> *service in self.targets) {
    if ([service respondsToSelector: anInvocation.selector]) {
      [anInvocation invokeWithTarget: service];
    }
  }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
  for (UIResponder<UISceneDelegate> *service in self.targets) {
    if ([service respondsToSelector: aSelector]) {
      return [service methodSignatureForSelector: aSelector];
    }
  }
  return [super methodSignatureForSelector: aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
  if ([super respondsToSelector: aSelector]) {
    return YES;
  }

  BOOL result = NO;
  for (UIResponder<UISceneDelegate> *service in self.targets) {
    if ([service respondsToSelector: aSelector]) {
      result = YES;
    }
  }
  if (result) {
    return YES;
  }

  return NO;
}

@end
