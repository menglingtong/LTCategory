//
//  NSObject+Swizzle.h
//  BlogDemo
//
//  Created by 孟令通 on 2018/3/12.
//  Copyright © 2018年 LryMlt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)

+ (BOOL)lt_swizzleMethod:(SEL)origSel withMethod:(SEL)altSel error:(NSError**)error;
+ (BOOL)lt_swizzleClassMethod:(SEL)origSel withClassMethod:(SEL)altSel error:(NSError**)error;

@end
