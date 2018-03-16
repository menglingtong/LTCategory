//
//  NSArray+Categories.h
//  BlogDemo
//
//  Created by 孟令通 on 2018/3/11.
//  Copyright © 2018年 LryMlt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Categories)
- (id)objectAtSafeIndex:(NSUInteger)index;
@end

@interface NSMutableArray (Categories)
/**
 Removes the object with the lowest-valued index in the array.
 If the array is empty, this method has no effect.
 
 @discussion Apple has implemented this method, but did not make it public.
 Override for safe.
 */
- (void)removeFirstObject;

/**
 Removes the object with the highest-valued index in the array.
 If the array is empty, this method has no effect.
 
 @discussion Apple's implementation said it raises an NSRangeException if the
 array is empty, but in fact nothing will happen. Override for safe.
 */
- (void)removeLastObject;

/**
 Removes and returns the object with the lowest-valued index in the array.
 If the array is empty, it just returns nil.
 
 @return The first object, or nil.
 */
- (nullable id)popFirstObject;

/**
 Removes and returns the object with the highest-valued index in the array.
 If the array is empty, it just returns nil.
 
 @return The first object, or nil.
 */
- (nullable id)popLastObject;

/**
 Reverse the index of object in this array.
 Example: Before @[ @1, @2, @3 ], After @[ @3, @2, @1 ].
 */
- (void)reverse;

/**
 Sort the object in this array randomly.
 */
- (void)shuffle;

@end
