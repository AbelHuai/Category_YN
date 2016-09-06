//
//  NSString+NSString.m
//  NSString
//
//  Created by 杨南 on 14-9-15.
//  Copyright (c) 2014年 杨南. All rights reserved.
//

#import "NSString+NSString.h"

@implementation NSString (NSString)

+(NSString *)stringUtils:(NSString *)str
{
    NSString *string = [NSString stringWithFormat:@"%@",str];
    if([string isEqualToString:@"<null>"])
    {
        string = @"";
    }
    if(string == nil)
    {
        string = @"";
    }
    if(string.length == 0)
    {
        string = @"";
    }
    if([string isEqualToString:@"null"])
    {
        string = @"";
    }
    if([string isEqualToString:@"(null)"])
    {
        string = @"";
    }
    return string;
}

@end
