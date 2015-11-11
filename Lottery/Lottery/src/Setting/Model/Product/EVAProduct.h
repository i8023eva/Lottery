//
//  EVAProduct.h
//  Lottery
//
//  Created by lyh on 15/11/11.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EVAProduct : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *customUrl;

+ (instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype) productWithDict:(NSDictionary *) dict;
+(NSMutableArray *) product;
@end
