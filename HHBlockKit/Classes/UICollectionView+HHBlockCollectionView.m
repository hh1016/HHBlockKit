//
//  UICollectionView+HHBlockCollectionView.m
//  HHBlockKit
//
//  Created by lch on 2022/1/5.
//

#import "UICollectionView+HHBlockCollectionView.h"
#import <objc/runtime.h>

static void *HHBlockNumberOfSection = &HHBlockNumberOfSection;
static void *HHBlockNumberOfRow = &HHBlockNumberOfRow;
static void *HHBlockSizeForHeader = &HHBlockSizeForHeader;
static void *HHBlockSizeForFooter = &HHBlockSizeForFooter;
static void *HHBlockViewForCell = &HHBlockViewForCell;
static void *HHBlockViewForHeader = &HHBlockViewForHeader;
static void *HHBlockViewForFooter = &HHBlockViewForFooter;
static void *HHBlockDidSelectRowAtIndexPath = &HHBlockDidSelectRowAtIndexPath;
static void *HHBlockCollectionViewCell = &HHBlockCollectionViewCell;
static void *HHBlockReuseIdentifier = &HHBlockReuseIdentifier;


@implementation UICollectionView (HHBlockCollectionView)
- (HH_CollectionViewFrame)hh_frame{
    WS;
    return ^(CGRect rect){
        SS;
        strongSelf.frame = rect;
        return strongSelf;
    };
}
- (HH_CollectionViewBackgroundColor)hh_backgroundColor{
    WS;
    return ^(UIColor *color){
        SS;
        strongSelf.backgroundColor = color;
        return strongSelf;
    };
}
- (HH_CollectionViewCornerRadius)hh_cornerRadius{
    WS;
    return ^(CGFloat cornerRadiusNum){
        SS;
        strongSelf.layer.cornerRadius = cornerRadiusNum;
        return strongSelf;
    };
}
- (HH_CollectionViewBorderWidth)hh_borderWidth{
    WS;
    return ^(CGFloat borderWidthNum){
        SS;
        strongSelf.layer.borderWidth = borderWidthNum;
        return strongSelf;
    };
}
- (HH_CollectionViewBorderColor)hh_borderColor{
    WS;
    return ^(UIColor *borderColor){
        SS;
        strongSelf.layer.borderColor = borderColor.CGColor;
        return strongSelf;
    };
}
- (HH_CollectionViewLayout)hh_collectionViewLayout{
    WS;
    return ^(UICollectionViewLayout *collectionViewLayout){
        SS;
        strongSelf.collectionViewLayout = collectionViewLayout;
        return strongSelf;
    };
}

- (HH_CollectionViewPrefetchingEnabled)hh_prefetchingEnabled{
    WS;
    return ^(BOOL prefetchingEnabled){
        SS;
        if (@available(iOS 10.0, *)) {
            strongSelf.prefetchingEnabled = prefetchingEnabled;
        } else {
            
        }
        return strongSelf;
    };
}
/**
 cell注册
 */
- (HH_CollectionViewRegisterClass)hh_registerClass{
    WS;
    return ^(id collectionCell,NSString *reuseIdentifier){
        SS;
        [strongSelf registerClass:[collectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
        objc_setAssociatedObject(self, HHBlockReuseIdentifier, reuseIdentifier, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(self, HHBlockCollectionViewCell, collectionCell, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return strongSelf;
    };
}
- (HH_CollectionViewRegisterNib)hh_registerNib{
    WS;
    return ^(id collectionCell,NSString *reuseIdentifier){
        SS;
        NSString *string = NSStringFromClass(collectionCell);
        [strongSelf registerNib:[UINib nibWithNibName:string bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
        objc_setAssociatedObject(self, HHBlockReuseIdentifier, reuseIdentifier, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(self, HHBlockCollectionViewCell, collectionCell, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return strongSelf;
    };
}

// 设置代理
- (void)configDelegate{
    if (self.delegate != self) {
        self.delegate = self;
    }
    if (self.dataSource != self) {
        self.dataSource = self;
    }
}

/**
 分组数量
 */
- (void)setHh_numberOfSection:(HH_CNumberOfSection _Nonnull)hh_numberOfSection{
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockNumberOfSection, hh_numberOfSection, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
/**
 每组中数量
 */
- (void)setHh_numberOfRow:(HH_CNumberOfRow _Nonnull)hh_numberOfRow{
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockNumberOfRow, hh_numberOfRow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
/**
 cell视图
 */
- (void)setHh_viewForCell:(HH_CViewForCell)hh_viewForCell{
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockViewForCell, hh_viewForCell, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setHh_viewForHeader:(HH_CViewForHeader)hh_viewForHeader{
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockViewForHeader, hh_viewForHeader, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setHh_viewForFooter:(HH_CViewForFooter)hh_viewForFooter{
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockViewForFooter, hh_viewForFooter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setHh_sizeForHeader:(HH_CSizeForHeader)hh_sizeForHeader{
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockSizeForHeader, hh_sizeForHeader, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setHh_sizeForFooter:(HH_CSizeForFooter)hh_sizeForFooter{
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockSizeForFooter, hh_sizeForFooter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setHh_didSelectRowAtIndexPath:(HH_CDidSelectRowAtIndexPath)hh_didSelectRowAtIndexPath{
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockDidSelectRowAtIndexPath, hh_didSelectRowAtIndexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// get 方法

/**
 cell视图
 */
- (HH_CNumberOfSection)hh_numberOfSection{
    return objc_getAssociatedObject(self, HHBlockNumberOfSection);
}
- (HH_CNumberOfRow)hh_numberOfRow{
    return  objc_getAssociatedObject(self, HHBlockNumberOfRow);
}
- (HH_CViewForCell)hh_viewForCell{
    return objc_getAssociatedObject(self, HHBlockViewForCell);
}
/**
 头视图
 */
- (HH_CViewForHeader)hh_viewForHeader{
    return objc_getAssociatedObject(self, HHBlockViewForHeader);
}
- (HH_CSizeForHeader)hh_sizeForHeader{
    return objc_getAssociatedObject(self, HHBlockSizeForHeader);
}
/**
 脚视图
 */
- (HH_CViewForFooter)hh_viewForFooter{
    return objc_getAssociatedObject(self, HHBlockViewForFooter);
}
- (HH_CSizeForFooter)hh_sizeForFooter{
    return objc_getAssociatedObject(self, HHBlockSizeForFooter);
}

// cell row点击
- (HH_CDidSelectRowAtIndexPath)hh_didSelectRowAtIndexPath{
    return objc_getAssociatedObject(self, HHBlockDidSelectRowAtIndexPath);
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.hh_numberOfSection ? self.hh_numberOfSection(collectionView) : 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.hh_numberOfRow ? self.hh_numberOfRow(collectionView,section) : 0;
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    // 拿出cell 判断是否有TableViewCell 注册类
    if (!self.hh_registerClass || !self.hh_registerNib) {
        NSAssert("cellForItemAtIndexPath", @"必须注册collectionViewCell");
    }
    NSString *reuseIdentifier = objc_getAssociatedObject(self, HHBlockReuseIdentifier);
    id cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (self.hh_viewForCell) {
        self.hh_viewForCell(collectionView, cell, indexPath);
    }
    return cell;
   
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (self.hh_didSelectRowAtIndexPath) {
        self.hh_didSelectRowAtIndexPath(collectionView, indexPath);
    }
}
/**
 头脚视图
 */
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        return self.hh_viewForHeader ? self.hh_viewForHeader(collectionView,indexPath) : nil;
    }else{
        return self.hh_viewForFooter ? self.hh_viewForFooter(collectionView,indexPath) : nil;;
    }
}

#pragma mark - UICollectionViewDelegateFlowLayout
// 分组头视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return self.hh_sizeForHeader ? self.hh_sizeForHeader(collectionView,section) : CGSizeZero;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return self.hh_sizeForFooter ? self.hh_sizeForFooter(collectionView,section) : CGSizeZero;
}


@end
