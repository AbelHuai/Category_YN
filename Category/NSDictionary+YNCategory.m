//
//  NSDictionary+YNCategory.m
//  Category
//
//  Created by Abel on 16/9/6.
//  Copyright © 2016年 杨南. All rights reserved.
//

#import "NSDictionary+YNCategory.h"

@implementation NSDictionary (YNCategory)

+ (NSDictionary*)fitDictionaryWithObject:(id)object;
{
    if ( object!= [NSNull null] && object != nil &&  [object isKindOfClass:[NSDictionary class]]) {
        return object;
    }
    return @{};
}

+ (BOOL)validateDictionaryWithObject:(id)object
{
    if ( object!= [NSNull null] && object != nil &&  [object isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    return NO;
}

@end
