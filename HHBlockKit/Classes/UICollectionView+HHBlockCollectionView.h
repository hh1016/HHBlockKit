//
//  UICollectionView+HHBlockCollectionView.h
//  HHBlockKit
//
//  Created by lch on 2022/1/5.
//

#import <UIKit/UIKit.h>
#import "HHBlockHeader.h"
NS_ASSUME_NONNULL_BEGIN
// 属性
typedef UICollectionView *_Nullable (^HH_CollectionViewFrame)(CGRect rect);
typedef UICollectionView *_Nullable (^HH_CollectionViewBackgroundColor)(UIColor *color);
typedef UICollectionView *_Nullable (^HH_CollectionViewCornerRadius)(CGFloat cornerRadiusNum);
typedef UICollectionView *_Nullable (^HH_CollectionViewBorderWidth)(CGFloat borderWidthNum);
typedef UICollectionView *_Nullable (^HH_CollectionViewBorderColor)(UIColor *borderColor);

typedef UICollectionView *_Nullable (^HH_CollectionViewLayout)(UICollectionViewLayout *collectionViewLayout);
typedef UICollectionView *_Nullable (^HH_CollectionViewPrefetchingEnabled)(BOOL prefetchingEnabled);
/**
 注册cell
 */
typedef UICollectionView *_Nullable (^HH_CollectionViewRegisterClass)(id collectionCell,NSString *reuseIdentifier);
typedef UICollectionView *_Nullable (^HH_CollectionViewRegisterNib)(id collectionCell,NSString *reuseIdentifier);
/**
 数量
 */
typedef NSInteger (^HH_CNumberOfSection)(UICollectionView * __weak collection);
typedef NSInteger (^HH_CNumberOfRow)(UICollectionView * __weak collection,NSInteger section);
/**
 cell
 */
typedef void (^HH_CViewForCell)(UICollectionView * __weak  collectionView, id cell,NSIndexPath *indexPath);
/**
 头脚视图
 */
typedef UICollectionReusableView *_Nullable(^HH_CViewForHeader)(UICollectionView * __weak collectionView,NSIndexPath *indexPath);
typedef UICollectionReusableView *_Nullable(^HH_CViewForFooter)(UICollectionView * __weak collectionView,NSIndexPath *indexPath);
/**
 高度
 */
typedef CGFloat (^HH_CHeightForCell)(UICollectionView * __weak collectionView,NSIndexPath *indexPath);
typedef CGSize (^HH_CSizeForHeader)(UICollectionView * __weak collectionView,NSInteger section);
typedef CGSize (^HH_CSizeForFooter)(UICollectionView * __weak collectionView,NSInteger section);
/**
 cell点击
 */
typedef void (^HH_CDidSelectRowAtIndexPath)(UICollectionView * __weak collectionView,NSIndexPath *indexPath);



@interface UICollectionView (HHBlockCollectionView)<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,copy,readonly) HH_CollectionViewFrame hh_frame;
@property (nonatomic,copy,readonly) HH_CollectionViewBackgroundColor hh_backgroundColor;
@property (nonatomic,copy,readonly) HH_CollectionViewCornerRadius hh_cornerRadius;
@property (nonatomic,copy,readonly) HH_CollectionViewBorderWidth hh_borderWidth;
@property (nonatomic,copy,readonly) HH_CollectionViewBorderColor hh_borderColor;
@property (nonatomic,copy,readonly) HH_CollectionViewLayout hh_collectionViewLayout;
@property (nonatomic,copy,readonly) HH_CollectionViewPrefetchingEnabled hh_prefetchingEnabled;

/**
 cell注册
 */
@property (nonatomic,copy,readonly) HH_CollectionViewRegisterClass hh_registerClass;
@property (nonatomic,copy,readonly) HH_CollectionViewRegisterNib hh_registerNib;
/**
 cell视图
 */
@property (nonatomic,copy) HH_CNumberOfSection hh_numberOfSection;
@property (nonatomic,copy) HH_CNumberOfRow hh_numberOfRow;
@property (nonatomic,copy) HH_CViewForCell hh_viewForCell;
/**
 头视图
 */
@property (nonatomic,copy) HH_CViewForHeader hh_viewForHeader ;
@property (nonatomic,copy) HH_CSizeForHeader hh_sizeForHeader;

/**
 脚视图
 */
@property (nonatomic,copy) HH_CViewForFooter hh_viewForFooter;
@property (nonatomic,copy) HH_CSizeForFooter hh_sizeForFooter;

// cell row点击
@property(nonatomic,copy)  HH_CDidSelectRowAtIndexPath hh_didSelectRowAtIndexPath;
@end

NS_ASSUME_NONNULL_END
