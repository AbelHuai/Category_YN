//
//  Cache.m
//  LuChang_iOS
//
//  Created by 杨南 on 14-10-9.
//  Copyright (c) 2014年 eims. All rights reserved.
//

#import "Cache.h"
#import "NSString+Hashing.h"

@implementation Cache

+ (Cache *)sharedInstance {
    static Cache *_sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        _sharedInstance = [[Cache alloc] init];
    });
    return _sharedInstance;
}

- (void) saveUrl:(NSString *)url withJson:(id )jsonStr
{
    // url  http://iappfree.candou.com:8080/free/applications/free?currency=rmb&page=
    // 网址做一个MD5 2fe1ab15a6cb1dc46b83fc7bb6d2b9ff
    // 把上面字符串加密 2fe1ab15a6cb1dc46b83fc7bb6d2b9ff MD5不可逆
    // 任意2个相同内容的字符串 的md5都是一样的... 图片不存在数据库中
    // 开源库
    NSString * jsonobjstr = nil;
    if ([NSJSONSerialization isValidJSONObject:jsonStr])
    {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonStr
                                                           options:NSJSONWritingPrettyPrinted error:&error];
        jsonobjstr =[[NSString alloc] initWithData:jsonData
                                          encoding:NSUTF8StringEncoding];
    }
    NSString *md5 = [url MD5Hash];
//    NSLog(@"md5 is %@", md5);
    
    NSString *dir = [NSHomeDirectory() stringByAppendingFormat:@"%@",
                     @"/Library/Caches/VCCache"];
    [[NSFileManager defaultManager] createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:nil];
    
    NSString *path = [NSString stringWithFormat:@"%@/%@", dir, md5];
//    NSLog(@"path is %@", path);
    // 把NSData写入到文件path中
//    NSData *d = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
//    [d writeToFile:path atomically:YES];
    [jsonobjstr writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];

}

- (id) readJsonFromFileByUrl:(NSString *)url
{
    NSString *md5 = [url MD5Hash];
    NSString *dir = [NSHomeDirectory() stringByAppendingFormat:@"%@",
                     @"/Library/Caches/VCCache"];
    NSString *path = [NSString stringWithFormat:@"%@/%@", dir, md5];
    
    // 时间...计算机的时间 2013-12-17 16:34:11 人类的时间Human being
    // 计算机的时间是从1970-01-01 00:00:00 到我们现在时间的秒数....公元前
    // 把2013-12-17 16:34:11转化成seconds
    // 2013-12-17 16:34:11  - 2003-12-17 16:34:11
//    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
//    // 得到path的上次修改时间
//    NSTimeInterval fileTime = [[self class] getFileLastModifyTime:path];
//    NSLog(@"%f modify time %f", now, fileTime);
//    
//    if (now - fileTime > maxTimeout) {
//        NSLog(@"真正的下载数据 ");
//        return nil;
//    }
    // 无论如何都在读取...
    /** 伪代码....
     if (当前时间 - path的上次修改时间 > 1*60*60) {
     // 说明过期了...
     return nil;
     }
     **/
    //    NSData *d = [NSData dataWithContentsOfFile:path];
    //    NSString *jsonStr = [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
    NSString *js = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    if(js == nil)return nil;
    NSData *jsonData = [js dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    id dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    return dic;
}




@end
