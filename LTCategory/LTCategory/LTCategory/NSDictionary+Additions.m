//
//  NSDictionary+Additions.m
//  BlogDemo
//
//  Created by 孟令通 on 2018/3/12.
//  Copyright © 2018年 LryMlt. All rights reserved.
//

#import "NSDictionary+Additions.h"

@implementation NSDictionary (Additions)

- (NSDictionary *)sortedByKey
{
    NSArray *sortedKeys = [self.allKeys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSComparisonResult result = [obj1 compare:obj2];
        return result;
    }];
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    for (NSInteger i = 0; i < sortedKeys.count; i++) {
        [dictionary setSafeObject:[self objectForKey:sortedKeys[i]] forKey:sortedKeys[i]];
    }
    return dictionary;
}

- (NSString *)serializationSortedByKey
{
    NSArray *sortedKeys = [self.allKeys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSComparisonResult result = [obj1 compare:obj2];
        return result;
    }];
    NSMutableArray *sortedStrs = [NSMutableArray arrayWithCapacity:sortedKeys.count];
    for (int i = 0; i < sortedKeys.count; i++) {
        NSString *key = sortedKeys[i];
        [sortedStrs addObject:[NSString stringWithFormat:@"%@=%@", key, self[key]]];
    }
    return [sortedStrs componentsJoinedByString:@"&"];
}

@end

@implementation NSMutableDictionary (Additions)
- (void)setSafeObject:(__nullable id)object forKey:(__nullable id<NSCopying>)key
{
    if (!object) return;
    [self setObject:object forKey:key];
}
@end
