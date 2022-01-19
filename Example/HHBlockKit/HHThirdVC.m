//
//  HHThirdVC.m
//  HHBlockKit_Example
//
//  Created by lch on 2022/1/5.
//  Copyright © 2022 hh1016. All rights reserved.
//

#import "HHThirdVC.h"
#import <HHBlockKit/HHBlockHeader.h>
#import "HHCollectionViewCell.h"
@interface HHThirdVC ()
@end

@implementation HHThirdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSInteger i = 1; i < 26; i++) {
        NSString *string = [NSString stringWithFormat:@"美女%ld.jpg",i];
        [array addObject:string];
    }
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.hh_itemSize(CGSizeMake((SCREENWIDTH - 30) /2, (SCREENWIDTH - 30) /2* 1.3) )
                .hh_minimumLineSpacing(10)
                .hh_minimumInteritemSpacing(10);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [self.view addSubview:collectionView];
    collectionView.hh_frame(CGRectMake(10, HHNavHeight, SCREENWIDTH-20, SCREENHEIGHT - HHNavHeight - HHTabBarHeight));
    collectionView.hh_registerNib([HHCollectionViewCell class], @"collectionViewCell");
    collectionView.hh_numberOfRow = ^NSInteger(UICollectionView *__weak  _Nonnull collection, NSInteger section) {
        return array.count;
    };
    collectionView.hh_viewForCell = ^(UICollectionView *__weak  _Nonnull collectionView, HHCollectionViewCell *cell, NSIndexPath * _Nonnull indexPath) {
//        HHCollectionViewCell *c = (HHCollectionViewCell *)cell;
        cell.imageView.image = [UIImage imageNamed:array[indexPath.row]];
    };
    collectionView.hh_didSelectRowAtIndexPath = ^(UICollectionView *__weak  _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"点击了第%ld个",indexPath.row);
    };
    
}

@end
