//
//  UICollectionViewFlowLayout+HHCollectionViewFlowLayout.m
//  HHBlockKit
//
//  Created by lch on 2022/1/5.
//

#import "UICollectionViewFlowLayout+HHCollectionViewFlowLayout.h"

@implementation UICollectionViewFlowLayout (HHCollectionViewFlowLayout)

- (HH_FlowLayoutMinimumLineSpacing)hh_minimumLineSpacing{
    WS;
    return ^(CGFloat space){
        SS;
        strongSelf.minimumLineSpacing = space;
        return self;
    };
}
- (HH_FlowLayoutMinimumInteritemSpacing)hh_minimumInteritemSpacing{
    WS;
    return ^(CGFloat space){
        SS;
        strongSelf.minimumInteritemSpacing = space;
        return self;
    };
}
- (HH_FlowLayoutItemSize)hh_itemSize{
    WS;
    return ^(CGSize size){
        SS;
        strongSelf.itemSize = size;
        return self;
    };
}
- (HH_FlowLayoutScrollDirection)hh_scrollDirection{
    WS;
    return ^(UICollectionViewScrollDirection scrollDirection){
        SS;
        strongSelf.scrollDirection = scrollDirection;
        return self;
    };
}
- (HH_FlowLayoutHeaderReferenceSize)hh_headerReferenceSize{
    WS;
    return ^(CGSize size){
        SS;
        strongSelf.headerReferenceSize = size;
        return self;
    };
}
- (HH_FlowLayoutHeaderReferenceSize)hh_footerReferenceSize{
    WS;
    return ^(CGSize size){
        SS;
        strongSelf.footerReferenceSize = size;
        return self;
    };
}
- (HH_FlowLayoutSectionInset)hh_sectionInset{
    WS;
    return ^(UIEdgeInsets sectionInset){
        SS;
        strongSelf.sectionInset = sectionInset;
        return self;
    };
}
@end
