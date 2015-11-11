//
//  EVAProduct.m
//  Lottery
//
//  Created by lyh on 15/11/11.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "EVAProduct.h"

@implementation EVAProduct

+ (instancetype)initWithDict:(NSDictionary *)dict{
    EVAProduct *product = [[EVAProduct alloc] init];
    
    product.title = dict[@"title"];
    product.icon = dict[@"icon"];
    product.url = dict[@"url"];
    product.customUrl = dict[@"customUrl"];
    product.ID = dict[@"id"];
    
    return product;
}

+(instancetype) productWithDict:(NSDictionary *)dict{
    
    return [self initWithDict:dict];
}

+(NSMutableArray *) product{
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"products" ofType:@"json"]];
    
    NSArray *jsonArr =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

    NSMutableArray *tmpArray = [NSMutableArray array];
    
    for (NSDictionary *item in jsonArr) {
        [tmpArray addObject:[self productWithDict:item]];
    }
    return tmpArray;
}

- (void)setIcon:(NSString *)icon
{
    _icon = [icon stringByReplacingOccurrencesOfString:@"@2x.png" withString:@""];
}
@end
