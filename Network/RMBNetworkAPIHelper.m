//
//  RMBNetworkAPIHelper.m
//  Daily
//
//  Created by Fakai Zhao on 15/8/8.
//  Copyright (c) 2015年 NeoWork. All rights reserved.
//

#import "RMBNetworkAPIHelper.h"
#import "RMBHTTPAPIClient.h"
#import "RMBNetworkAPICache.h"
#import "RMBCache.h"

@interface RMBNetworkAPIHelper ()

//
@property (nonatomic, retain) RMBHTTPAPIClient *httpAPIClient;

//
@property (nonatomic, retain, readwrite) RMBCache *httpCache;

@end

@implementation RMBNetworkAPIHelper

#pragma mark -
#pragma mark - Overload Method

// 初始化自定义NetworkAPIHelper
- (instancetype)initWithBaseURL:(NSURL *)aURL
                          cache:(RMBCache *)cache {
    //
    if (self = [super init]) {
        
        //
        self.httpAPIClient = [[RMBHTTPAPIClient alloc] initWithBaseURL:aURL];
        self.httpCache = cache;
    }
    
    return self;
}

/**
 *  初始化默认httpClient
 *
 *  @return 默认httpClient
 */
- (id)initDefaultHelper {
    
    self = [self initWithBaseURL:[NSURL URLWithString:@"http://127.0.0.1:8088"]
                                  cache:[RMBNetworkAPICache sharedCache]];
    //
    if (self) {
        
    }
    
    return self;
}


#pragma mark -
#pragma mark - Public API

+ (instancetype)defaultHelper
{
    static RMBNetworkAPIHelper *__defaultHelper = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        __defaultHelper = [[self alloc] initDefaultHelper];
    });
    
    return __defaultHelper;
}

- (void)reloadHttpClientWithBaseURL:(NSString *)aURL {
    self.httpAPIClient = [[RMBHTTPAPIClient alloc] initWithBaseURL:[NSURL URLWithString:aURL]];
}

- (AFHTTPRequestOperation *)GET:(id)aModel
                 JSONModelClass:(Class)responseModelClass
                        success:(BlockRMBHTTPRequestSuccess)success
                        failure:(BlockRMBHTTPRequestFailure)failure
{
    //
//    __weak __typeof(&*self)weakSelf = self;
    
    //
    BlockRMBHTTPRequestSuccess doSuccess = ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //
//        NSError *error = nil;
//        NSData *dataResponse = (NSData *)responseObject;
        
        NSLog(@"%@",operation);

    };
    
    //
    BlockRMBHTTPRequestFailure doFailure = ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error.userInfo);
    };
    
    //
    AFHTTPRequestOperation *request = nil;
    
    request = [self.httpAPIClient httpRequestForURL:@"http://127.0.0.1:8088"
                                             httpMethod:@"GET"
                                            httpHeaders:nil
                                         withParameters:nil
                                                success:doSuccess
                                                failure:doFailure];
    //
    if (request != nil) {
        [self.httpAPIClient.operationQueue addOperation:request];
    }

    return request;
}

@end
