//
//  EVAHelp.m
//  Lottery
//
//  Created by lyh on 15/11/11.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "EVAHelp.h"

@implementation EVAHelp

+(instancetype) initWithDict:(NSDictionary *)dict{
    EVAHelp *help = [[EVAHelp alloc]init];
    
    help.title = dict[@"title"];
    help.html = dict[@"html"];
    help.ID = dict[@"id"];
    
    return help;
}

+(instancetype) helpWithDict:(NSDictionary *)dict{
    
    return [self initWithDict:dict];
}

+(NSMutableArray *) help{
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"help" ofType:@"json"]];
    
    NSArray *jsonArr =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray *tmpArray = [NSMutableArray array];
    
    for (NSDictionary *item in jsonArr) {
        [tmpArray addObject:[self helpWithDict:item]];
    }
    return tmpArray;
}

-(NSString *) description{
    
    return [NSString stringWithFormat:@"<%@: %p> {title: %@}", self.class, self, self.title];
}
@end
