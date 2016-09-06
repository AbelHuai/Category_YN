//
//  Cache.h
//  LuChang_iOS
//
//  Created by 杨南 on 14-10-9.
//  Copyright (c) 2014年 eims. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cache : NSObject

+ (Cache *)sharedInstance;

- (void) saveUrl:(NSString *)url withJson:(NSString *)jsonStr;

- (NSString *) readJsonFromFileByUrl:(NSString *)url;

@end
