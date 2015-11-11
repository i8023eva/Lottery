//
//  EVAProductCell.m
//  Lottery
//
//  Created by lyh on 15/11/11.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "EVAProductCell.h"
#import "EVAProduct.h"

@interface EVAProductCell ()
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation EVAProductCell

-(void)setProduct:(EVAProduct *)product {
    _product = product;
    
    self.productImageView.image = [UIImage imageNamed:_product.icon];
    self.nameLabel.text = _product.title;
}

- (void)awakeFromNib {
    // Initialization code
    self.productImageView.layer.cornerRadius = 10;
    self.productImageView.clipsToBounds = YES;
}


@end
