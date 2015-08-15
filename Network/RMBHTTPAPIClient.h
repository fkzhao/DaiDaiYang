//
//  RMBHTTPAPIClient.h
//  Daily
//
//  Created by Fakai Zhao on 15/8/8.
//  Copyright (c) 2015年 NeoWork. All rights reserved.
//

#import "AFNetworking.h"

//
typedef void (^BlockRMBHTTPRequestSuccess)(AFHTTPRequestOperation *operation, id responseObject);
typedef void (^BlockRMBHTTPRequestFailure)(AFHTTPRequestOperation *operation, NSError *error);


//
@interface RMBHTTPAPIClient : AFHTTPRequestOperationManager

/**
 *  构造http请求
 *
 *  @param aURL         URL PATH
 *  @param httpMethod   @"GET" @"POST"
 *  @param httpHeaders  请求头信息
 *  @param parameters   请求参数
 *  @param success      成功回调
 *  @param failure      失败回调
 *
 *  @return http request 可能为nil
 */
- (AFHTTPRequestOperation *)httpRequestForURL:(NSString *)aURL
                                   httpMethod:(NSString *)httpMethod
                                  httpHeaders:(NSDictionary *)httpHeaders
                               withParameters:(NSDictionary *)parameters
                                      success:(BlockRMBHTTPRequestSuccess)success
                                      failure:(BlockRMBHTTPRequestFailure)failure;

@end
