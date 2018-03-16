//
//  NSDictionary+Additions.h
//  BlogDemo
//
//  Created by 孟令通 on 2018/3/12.
//  Copyright © 2018年 LryMlt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Additions)
- (NSDictionary *)sortedByKey;
- (NSString *)serializationSortedByKey;
@end

@interface NSMutableDictionary (Additions)
- (void)setSafeObject:(__nullable id)object forKey:(__nullable id<NSCopying>)key;
@end
