//
//  NSArray+Categories.m
//  BlogDemo
//
//  Created by 孟令通 on 2018/3/11.
//  Copyright © 2018年 LryMlt. All rights reserved.
//

#import "NSArray+Categories.h"

@implementation NSArray (Categories)
- (id)objectAtSafeIndex:(NSUInteger)index
{
    if (self.count > index) {
        return self[index];
    }
    return nil;
}
@end

@implementation NSMutableArray (Categories)

-(void)removeFirstObject
{
    if (self.count) {
        [self removeObjectAtIndex:0];
    }
}

#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (void)removeLastObject
{
    if (self.count) {
        [self removeObjectAtIndex:self.count - 1];
    }
}

- (id)popFirstObject
{
    id obj = nil;
    if (self.count) {
        obj = self.firstObject;
        [self removeFirstObject];
    }
    return obj;
}

- (id)popLastObject
{
    id obj = nil;
    if (self.count) {
        obj = self.lastObject;
        [self removeLastObject];
    }
    return obj;
}

- (void)reverse
{
    NSUInteger count = self.count;
    int mid = floor(count / 2.0);
    for (NSUInteger i = 0; i < mid; i++) {
        [self exchangeObjectAtIndex:i withObjectAtIndex:count - (i + 1)];
    }
}

- (void)shuffle
{
    for (NSUInteger i = self.count; i > 1; i--) {
        [self exchangeObjectAtIndex:(i - 1) withObjectAtIndex:arc4random_uniform((u_int32_t)i)];
    }
}

@end
