//
//  EVAHelp.h
//  Lottery
//
//  Created by lyh on 15/11/11.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EVAHelp : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *html;

+(instancetype) initWithDict:(NSDictionary *) dict;
+(instancetype) helpWithDict:(NSDictionary *) dict;

+(NSMutableArray *) help;
@end
