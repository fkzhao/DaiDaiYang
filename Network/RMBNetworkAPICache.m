//
//  RMBNetworkAPICache.m
//  Daily
//
//  Created by Fakai Zhao on 15/8/8.
//  Copyright (c) 2015年 NeoWork. All rights reserved.
//

#import "RMBNetworkAPICache.h"

@implementation RMBNetworkAPICache

+ (instancetype)sharedCache {
    static RMBNetworkAPICache *__cache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        __cache = [[self alloc] initWithNamespace:@"apiServer" usingMemoryCache:YES];
//        // API内存缓存大小
//        __cache.maxMemoryCost = 10 * 1024 * 1024;
    });
    return __cache;
}

@end
