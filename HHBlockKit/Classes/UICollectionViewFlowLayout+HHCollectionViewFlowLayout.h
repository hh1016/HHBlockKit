//
//  UICollectionViewFlowLayout+HHCollectionViewFlowLayout.h
//  HHBlockKit
//
//  Created by lch on 2022/1/5.
//

#import <UIKit/UIKit.h>
#import "HHBlockHeader.h"
NS_ASSUME_NONNULL_BEGIN


typedef UICollectionViewFlowLayout *_Nullable (^HH_FlowLayoutMinimumLineSpacing)(CGFloat space);
typedef UICollectionViewFlowLayout *_Nullable (^HH_FlowLayoutMinimumInteritemSpacing)(CGFloat space);
typedef UICollectionViewFlowLayout *_Nullable (^HH_FlowLayoutItemSize)(CGSize size);
typedef UICollectionViewFlowLayout *_Nullable (^HH_FlowLayoutScrollDirection)(UICollectionViewScrollDirection scrollDirection);
typedef UICollectionViewFlowLayout *_Nullable (^HH_FlowLayoutHeaderReferenceSize)(CGSize headerReferenceSize);
typedef UICollectionViewFlowLayout *_Nullable (^HH_FlowLayoutFooterReferenceSize)(CGSize footerReferenceSize);
typedef UICollectionViewFlowLayout *_Nullable (^HH_FlowLayoutSectionInset)(UIEdgeInsets sectionInset);

@interface UICollectionViewFlowLayout (HHCollectionViewFlowLayout)

/// 竖向间隔
@property (nonatomic,copy,readonly) HH_FlowLayoutMinimumLineSpacing hh_minimumLineSpacing;
/// 横向间隔
@property (nonatomic,copy,readonly) HH_FlowLayoutMinimumInteritemSpacing hh_minimumInteritemSpacing;
// item 大小
@property (nonatomic,copy,readonly) HH_FlowLayoutItemSize hh_itemSize;

// item 大小
@property (nonatomic,copy,readonly) HH_FlowLayoutScrollDirection hh_scrollDirection;
// item 大小
@property (nonatomic,copy,readonly) HH_FlowLayoutHeaderReferenceSize hh_headerReferenceSize;
// item 大小
@property (nonatomic,copy,readonly) HH_FlowLayoutFooterReferenceSize hh_footerReferenceSize;
// item 大小
@property (nonatomic,copy,readonly) HH_FlowLayoutSectionInset hh_sectionInset;

@end

NS_ASSUME_NONNULL_END
