//
//  AppDelegate+AppDelegate_Proxy.m
//
//  Created by dDomovoj on 7/26/21.
//  Copyright © 2021 AppsTea. All rights reserved.
//

#import "SubsTemplate-Swift.h"

@implementation AppDelegate (Proxy)

+ (BOOL)instancesRespondToSelector:(SEL)aSelector {
  return YES;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
  for (UIResponder<UIApplicationDelegate> *service in self.services) {
    if ([service respondsToSelector: anInvocation.selector]) {
      [anInvocation invokeWithTarget: service];
    }
  }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
  for (UIResponder<UIApplicationDelegate> *service in self.services) {
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
  for (UIResponder<UIApplicationDelegate> *service in self.services) {
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
