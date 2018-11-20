//
//  NSData+EHKAES.h
//  EHKAnimationGroup
//
//  Created by 梁自强 on 2017/11/14.
//  Copyright © 2017年 ehking. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>


@interface NSData (EHKAES)
//加密
- (NSData *) AES256_Encrypt:(NSString *)key;
//解密
- (NSData *) AES256_Decrypt:(NSString *)key;

//追加64编码
- (NSString *)newStringInBase64FromData;

//同上64编码
+ (NSString*)base64encode:(NSString*)str;
@end
