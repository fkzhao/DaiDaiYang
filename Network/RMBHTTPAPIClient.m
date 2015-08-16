//
//  RMBHTTPAPIClient.m
//  Daily
//
//  Created by Fakai Zhao on 15/8/8.
//  Copyright (c) 2015年 NeoWork. All rights reserved.
//

#import "RMBHTTPAPIClient.h"

@implementation RMBHTTPAPIClient

#pragma mark -
#pragma mark Override Methods

- (id)initWithBaseURL:(NSURL *)url {
    
    if (self = [super initWithBaseURL:url]) {
        
        //
        self.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        //
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        queue.name = @"com.neowork.common.network";
        queue.maxConcurrentOperationCount = 5;
        self.operationQueue = queue;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (AFHTTPRequestOperation *)httpRequestForURL:(NSString *)aURL
                                   httpMethod:(NSString *)httpMethod
                                  httpHeaders:(NSDictionary *)httpHeaders
                               withParameters:(NSDictionary *)parameters
                                      success:(BlockRMBHTTPRequestSuccess)success
                                      failure:(BlockRMBHTTPRequestFailure)failure {
    
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:httpMethod
                                                                   URLString:[[NSURL URLWithString:aURL relativeToURL:self.baseURL] absoluteString]
                                                                  parameters:parameters
                                                                       error:nil];
    //
    if ([httpMethod caseInsensitiveCompare:@"get"] == NSOrderedSame) {
        request.HTTPShouldUsePipelining = YES;
    }
    //
    if ([httpHeaders isKindOfClass:[NSDictionary class]]) {
        [request setAllHTTPHeaderFields:httpHeaders];
    }
    
    //
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:success failure:failure];
    
    
    return operation;
}


@end
