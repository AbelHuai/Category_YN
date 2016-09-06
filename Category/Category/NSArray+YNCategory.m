//
//  NSArray+YNCategory.m
//  Category
//
//  Created by Abel on 16/9/6.
//  Copyright © 2016年 杨南. All rights reserved.
//

#import "NSArray+YNCategory.h"

@implementation NSArray (YNCategory)

+ (NSArray *)fitArrayByObject:(id)object;
{
    if ( object!= [NSNull null] && object != nil &&  [object isKindOfClass:[NSArray class]]) {
        return object;
    }
    return @[];
}

+ (BOOL)validateArrayWithObject:(id)object
{
    if ( object!= [NSNull null] && object != nil &&  [object isKindOfClass:[NSArray class]]) {
        return YES;
    }
    return NO;
}



@end
