//
//  NSString+Additions.h
//  BlogDemo
//
//  Created by 孟令通 on 2018/3/8.
//  Copyright © 2018年 LryMlt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Additions)

+ (BOOL)regularForTel:(NSString *)tel;
+ (BOOL)regularForPsw:(NSString *)psw;
+ (BOOL)regulatForBankCardNumber:(NSString *)cardNumber;

@property (readonly) NSString *md5String;
@property (readonly) NSString *sha1String;
@property (readonly) NSString *sha256String;
@property (readonly) NSString *sha512String;

- (NSString *)hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

@end
