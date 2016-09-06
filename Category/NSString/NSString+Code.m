//
//  NSString+Code.m
//  JYMall
//
//  Created by d.e on 15-2-10.
//  Copyright (c) 2015年 de. All rights reserved.
//

#import "NSString+Code.h"
#import <CommonCrypto/CommonDigest.h> 

@implementation NSString (Code)

- (NSString*)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr,(CC_LONG)strlen(cStr),result);
    NSString* md5str=[[NSString stringWithFormat:
                       @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                       result[0], result[1], result[2], result[3],
                       result[4], result[5], result[6], result[7],
                       result[8], result[9], result[10], result[11],
                       result[12], result[13], result[14], result[15]] lowercaseString];
    
    return md5str;
}

- (NSString*)MD5WithUppercaseString
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr,(CC_LONG)strlen(cStr),result);
    NSString* md5str=[[NSString stringWithFormat:
                       @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                       result[0], result[1], result[2], result[3],
                       result[4], result[5], result[6], result[7],
                       result[8], result[9], result[10], result[11],
                       result[12], result[13], result[14], result[15]] lowercaseString];
    

    return [md5str uppercaseString];
}

- (NSString *)urlDecode
{
    NSString *decodeString = [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return decodeString;
}
@end
