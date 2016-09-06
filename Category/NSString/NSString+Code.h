//
//  NSString+Code.h
//  JYMall
//
//  Created by d.e on 15-2-10.
//  Copyright (c) 2015年 de. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CommonCrypto/CommonCryptor.h>

@interface NSString (Code)
- (NSString*)md5;
- (NSString*)MD5WithUppercaseString;
- (NSString*)urlDecode;
@end
