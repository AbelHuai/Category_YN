//
//  NSDictionary+YNCategory.h
//  Category
//
//  Created by Abel on 16/9/6.
//  Copyright © 2016年 杨南. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YNCategory)

+ (NSDictionary*)fitDictionaryWithObject:(id)object;

+ (BOOL)validateDictionaryWithObject:(id)object;

@end
