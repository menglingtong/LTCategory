//
//  NSObject+Swizzle.m
//  BlogDemo
//
//  Created by 孟令通 on 2018/3/12.
//  Copyright © 2018年 LryMlt. All rights reserved.
//

#import "NSObject+Swizzle.h"

#import <objc/runtime.h>
#import <objc/message.h>

#define SetNSErrorFor(FUNC, ERROR_VAR, FORMAT,...)    \
    if (ERROR_VAR) {    \
        NSString *errStr = [NSString stringWithFormat:@"%s: " FORMAT,FUNC,##__VA_ARGS__]; \
        *ERROR_VAR = [NSError errorWithDomain:@"NSCocoaErrorDomain" \
                                         code:-1    \
                                     userInfo:[NSDictionary dictionaryWithObject:errStr forKey:NSLocalizedDescriptionKey]]; \
    }
#define SetNSError(ERROR_VAR, FORMAT,...) SetNSErrorFor(__func__, ERROR_VAR, FORMAT, ##__VA_ARGS__)

#define GetClass(obj) object_getClass(obj)

@implementation NSObject (Swizzle)

+ (BOOL)lt_swizzleMethod:(SEL)origSel withMethod:(SEL)altSel error:(NSError**)error
{
    Method origMethod = class_getInstanceMethod(self, origSel);
    if (!origMethod) {
        SetNSError(error, @"original method %@ not found for class %@", NSStringFromSelector(origSel), [self class]);
        return NO;
    }
    
    Method altMethod = class_getInstanceMethod(self, altSel);
    if (!altMethod) {
        SetNSError(error, @"alternate method %@ not found for class %@", NSStringFromSelector(altSel), [self class]);
        return NO;
    }
    
    class_addMethod(self, origSel, class_getMethodImplementation(self, origSel), method_getTypeEncoding(origMethod));
    class_addMethod(self, altSel, class_getMethodImplementation(self, altSel), method_getTypeEncoding(altMethod));
    
    method_exchangeImplementations(origMethod, altMethod);
    return YES;
}

+ (BOOL)lt_swizzleClassMethod:(SEL)origSel withClassMethod:(SEL)altSel error:(NSError**)error
{
    return [GetClass((id)self) lt_swizzleMethod:origSel withMethod:altSel error:error];
}

@end
