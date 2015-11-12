//
//  ProductViewController.m
//  Lottery
//
//  Created by lyh on 15/11/11.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "ProductViewController.h"
#import "EVAProduct.h"
#import "EVAProductCell.h"

@interface ProductViewController ()
@property (nonatomic, strong) NSMutableArray *products;
@end

@implementation ProductViewController

static NSString * const reuseIdentifier = @"Cell";

-(NSMutableArray *)products {
    if (_products == nil) {
        _products = [EVAProduct product];
    }
    return _products;
}
#pragma mark - 外界实例化时
-(instancetype)init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    // 每一个cell的尺寸
    layout.itemSize = CGSizeMake(80, 80);
    
    // 垂直间距
    layout.minimumLineSpacing = 10;
    
    // 水平间距
    layout.minimumInteritemSpacing = 0;
    
    // 内边距
    layout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // 注册UICollectionViewCell，如果没有从缓存池找到，就会自动帮我们创建UICollectionViewCell
    UINib *xib = [UINib nibWithNibName:@"EVAProductCell" bundle:nil];
    // Register cell classes
    [self.collectionView registerNib:xib forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EVAProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    // 获取模型
    EVAProduct *p = self.products[indexPath.item];
    
    cell.product = p;
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    EVAProduct *product = self.products[indexPath.item];
#warning 真机
    NSString *appStr = [NSString stringWithFormat:@"%@://%@", product.customUrl, product.ID];
    
    NSURL *appURL = [NSURL URLWithString:appStr];
    
    UIApplication *app = [UIApplication sharedApplication];
    
    if ([app canOpenURL:appURL]) {
        [app openURL:appURL];
    }else {
        [app openURL:[NSURL URLWithString:product.url]];
    }
    
}

#pragma mark <UICollectionViewDelegate>


@end
