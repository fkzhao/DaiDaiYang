//
//  RMBNetworkAPIHelper.h
//  Daily
//
//  Created by Fakai Zhao on 15/8/8.
//  Copyright (c) 2015年 NeoWork. All rights reserved.
//

#import "RMBHTTPAPIClient.h"

@class RMBCache;

@interface RMBNetworkAPIHelper : NSObject

+ (instancetype)defaultHelper;


// 初始化自定义NetworkAPIHelper
- (instancetype)initWithBaseURL:(NSURL *)aURL
                          cache:(RMBCache *)cache;


/**
 *  修改BaseURL
 *
 *  @param aURL BaseURL
 */
- (void)reloadHttpClientWithBaseURL:(NSString *)aURL;


/**
 *  封装的GET请求
 *
 *  @param aModel             请求和参数Model
 *  @param responseModelClass 解析的JSONModel
 *  @param success            成功回调
 *  @param failure            失败回调
 *
 *  @return 已发送的request 可以为nil
 */
- (AFHTTPRequestOperation *)GET:(id)aModel
                 JSONModelClass:(Class)responseModelClass
                        success:(BlockRMBHTTPRequestSuccess)success
                        failure:(BlockRMBHTTPRequestFailure)failure;
@end
