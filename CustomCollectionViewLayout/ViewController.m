//
//  ViewController.m
//  CustomCollectionViewLayout
//
//  Created by yankang on 2017/4/24.
//  Copyright © 2017年 yankang. All rights reserved.
//

#import "ViewController.h"
#import "ColumnCollectionViewCell.h"
#import "RowCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.collectionView registerNib:[UINib nibWithNibName:@"ColumnCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"columnCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"RowCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"rowCell"];
    self.automaticallyAdjustsScrollViewInsets = NO;//防止collectionView向下偏移导航条高度
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 50;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            ColumnCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"columnCell" forIndexPath:indexPath];
            cell.backgroundColor = [UIColor whiteColor];
            cell.columnLabel.text = @"column/row";
            return cell;
            
        }else {
            RowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"rowCell" forIndexPath:indexPath];
            cell.backgroundColor = [UIColor whiteColor];
            cell.rowLabel.text = [NSString stringWithFormat:@"r=%lu",indexPath.row];
            return cell;
        }
    }else{
        if (indexPath.row == 0) {
            ColumnCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"columnCell" forIndexPath:indexPath];
            if (indexPath.section % 2 != 0) {
                cell.backgroundColor = [UIColor redColor];
            } else {
                cell.backgroundColor = [UIColor whiteColor];
            }
            cell.columnLabel.text = [NSString stringWithFormat:@"c=%lu",indexPath.section];
            return cell;
            
        }else {
            RowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"rowCell" forIndexPath:indexPath];
            if (indexPath.section % 2 != 0) {
                cell.backgroundColor = [UIColor redColor];
            } else {
                cell.backgroundColor = [UIColor whiteColor];
            }
            cell.rowLabel.text = [NSString stringWithFormat:@"%lu/%lu",indexPath.section,indexPath.row];
            return cell;

        }

    }
    
    
    
    
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
