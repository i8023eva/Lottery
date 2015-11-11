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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

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

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
