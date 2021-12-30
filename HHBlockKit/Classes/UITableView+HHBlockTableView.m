//
//  UITableView+HHBlockTableView.m
//  HHBlockKit
//
//  Created by lch on 2021/12/29.
//

#import "UITableView+HHBlockTableView.h"
#import <objc/runtime.h>

static void *HHBlockNumberOfSection = &HHBlockNumberOfSection;
static void *HHBlockNumberOfRow = &HHBlockNumberOfRow;
static void *HHBlockHeightForCell = &HHBlockHeightForCell;
static void *HHBlockHeightForHeader = &HHBlockHeightForHeader;
static void *HHBlockHeightForFooter = &HHBlockHeightForFooter;
static void *HHBlockViewForCell = &HHBlockViewForCell;
static void *HHBlockViewForHeader = &HHBlockViewForHeader;
static void *HHBlockViewForFooter = &HHBlockViewForFooter;
static void *HHBlockDidSelectRowAtIndexPath = &HHBlockDidSelectRowAtIndexPath;
static void *HHBlockTableViewCell = &HHBlockTableViewCell;
static void *HHBlockReuseIdentifier = &HHBlockReuseIdentifier;

@implementation UITableView (HHBlockTableView)


- (HH_TableViewFrame)hh_frame{
    WS;
    return ^(CGRect rect){
        SS;
        strongSelf.frame = rect;
        return self;
    };
}
- (HH_TableViewBackgroundColor)hh_backgroundColor{
    WS;
    return ^(UIColor *color){
        SS;
        strongSelf.backgroundColor = color;
        return self;
    };
}
- (HH_TableViewCornerRadius)hh_cornerRadius{
    WS;
    return ^(CGFloat cornerRadiusNum){
        SS;
        strongSelf.layer.cornerRadius = cornerRadiusNum;
        return self;
    };
}
- (HH_TableViewBorderWidth)hh_borderWidth{
    WS;
    return ^(CGFloat borderWidthNum){
        SS;
        strongSelf.layer.borderWidth = borderWidthNum;
        return self;
    };
}
- (HH_TableViewBorderColor)hh_borderColor{
    WS;
    return ^(UIColor *borderColor){
        SS;
        strongSelf.layer.borderColor = borderColor.CGColor;
        return self;
    };
}


- (HH_TableViewRowHeight)hh_rowHeight{
    WS;
    return ^(CGFloat rowHeight){
        SS;
        strongSelf.rowHeight = rowHeight;
        return strongSelf;
    };
}
- (HH_TableViewSectionHeaderHeight)hh_sectionHeaderHeight{
    WS;
    return ^(CGFloat sectionHeaderHeight){
        SS;
        strongSelf.sectionHeaderHeight = sectionHeaderHeight;
        return strongSelf;
    };
}
- (HH_TableViewSectionFooterHeight)hh_sectionFooterHeight{
    WS;
    return ^(CGFloat sectionFooterHeight){
        SS;
        strongSelf.sectionFooterHeight = sectionFooterHeight;
        return strongSelf;
    };
}
- (HH_TableViewEstimatedRowHeight)hh_estimatedRowHeight{
    WS;
    return ^(CGFloat estimatedRowHeight){
        SS;
        strongSelf.estimatedRowHeight = estimatedRowHeight;
        return strongSelf;
    };
}
- (HH_TableViewEstimatedSectionHeaderHeight)hh_estimatedSectionHeaderHeight{
    WS;
    return ^(CGFloat estimatedSectionHeaderHeight){
        SS;
        strongSelf.estimatedSectionHeaderHeight = estimatedSectionHeaderHeight;
        return strongSelf;
    };
}
- (HH_TableViewEstimatedSectionFooterHeight)hh_estimatedSectionFooterHeight{
    WS;
    return ^(CGFloat estimatedSectionFooterHeight){
        SS;
        strongSelf.estimatedSectionFooterHeight = estimatedSectionFooterHeight;
        return strongSelf;
    };
}

- (HH_TableViewSectionHeaderTopPadding)hh_sectionHeaderTopPadding{
    WS;
    return ^(CGFloat sectionHeaderTopPadding){
        SS;
        if (@available(iOS 15.0, *)) {
            strongSelf.sectionHeaderTopPadding = sectionHeaderTopPadding;
        }
        return strongSelf;
    };
}

- (HH_TableViewRegisterClass)hh_registerClass{
    WS
    return ^(id tableViewCell,NSString *reuseIdentifier){
        SS
        [strongSelf registerClass:[tableViewCell class] forCellReuseIdentifier:reuseIdentifier];
        objc_setAssociatedObject(self, HHBlockReuseIdentifier, reuseIdentifier, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(self, HHBlockTableViewCell, tableViewCell, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return strongSelf;
    };
}
- (HH_TableViewRegisterNib)hh_registerNib{
    WS
    return ^(id tableViewCell,NSString *reuseIdentifier){
        SS
        NSString *cellString = NSStringFromClass(tableViewCell);
        [self registerNib:[UINib nibWithNibName:cellString bundle:nil] forCellReuseIdentifier:reuseIdentifier];
        objc_setAssociatedObject(self, HHBlockReuseIdentifier, reuseIdentifier, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(self, HHBlockTableViewCell, tableViewCell, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
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
 头视图
 */
- (void)setHh_viewForHeader:(HH_viewForHeader _Nonnull)hh_viewForHeader{
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockViewForHeader, hh_viewForHeader, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setHh_heightForHeader:(HH_heightForHeader _Nonnull)hh_heightForHeader{
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockHeightForHeader, hh_heightForHeader, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


/**
 脚视图
 */
- (void)setHh_heightForFooter:(HH_heightForFooter _Nonnull)hh_heightForFooter{
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockHeightForFooter, hh_heightForFooter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setHh_viewForFooter:(HH_viewForFooter _Nonnull)hh_viewForFooter{
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockViewForFooter, hh_viewForFooter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
/**
 cell视图
 */
- (void)setHh_numberOfSection:(HH_numberOfSection _Nonnull)hh_numberOfSection{
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockNumberOfSection, hh_numberOfSection, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setHh_numberOfRow:(HH_numberOfRow _Nonnull)hh_numberOfRow{
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockNumberOfRow, hh_numberOfRow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setHh_heightForCell:(HH_heightForCell _Nonnull)hh_heightForCell{
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockHeightForCell, hh_heightForCell, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setHh_viewForCell:(HH_viewForCell _Nonnull)hh_viewForCell{
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockViewForCell, hh_viewForCell, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
// cell row点击
- (void)setHh_didSelectRowAtIndexPath:(HH_didSelectRowAtIndexPath _Nonnull)hh_didSelectRowAtIndexPath{
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockDidSelectRowAtIndexPath, hh_didSelectRowAtIndexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


// get方法

/**
 头视图
 */
- (HH_viewForHeader)hh_viewForHeader{
    return objc_getAssociatedObject(self, HHBlockViewForHeader);
}
- (HH_heightForHeader)hh_heightForHeader{
    return objc_getAssociatedObject(self, HHBlockHeightForHeader);
}
/**
 脚视图
 */
- (HH_heightForFooter)hh_heightForFooter{
    return objc_getAssociatedObject(self, HHBlockHeightForFooter);
}
- (HH_viewForFooter)hh_viewForFooter{
    return objc_getAssociatedObject(self, HHBlockViewForFooter);
}
/**
 cell视图
 */
- (HH_numberOfSection)hh_numberOfSection{
    return objc_getAssociatedObject(self, HHBlockNumberOfSection);
}
- (HH_numberOfRow _Nonnull)hh_numberOfRow{
    return objc_getAssociatedObject(self, HHBlockNumberOfRow);
}
- (HH_heightForCell)hh_heightForCell{
    return objc_getAssociatedObject(self, HHBlockHeightForCell);
}
- (HH_viewForCell _Nonnull)hh_viewForCell{
    return objc_getAssociatedObject(self, HHBlockViewForCell);
}
// cell row点击
- (HH_didSelectRowAtIndexPath)hh_didSelectRowAtIndexPath{
    return objc_getAssociatedObject(self, HHBlockDidSelectRowAtIndexPath);
}

#pragma mark - uitableViewDataSourceDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.hh_numberOfSection ? self.hh_numberOfSection(tableView) : 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.hh_numberOfRow ? self.hh_numberOfRow(tableView,section) : 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *reuseIdentifier = objc_getAssociatedObject(self, HHBlockReuseIdentifier);
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    // 拿出cell 判断是否有TableViewCell 注册类
    if (self.hh_registerClass) {
        cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    }else{
        id cellClass = objc_getAssociatedObject(self, HHBlockTableViewCell);
        cell = [[cellClass alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    if (self.hh_viewForCell) {
        self.hh_viewForCell(tableView, cell, indexPath);
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.hh_didSelectRowAtIndexPath) {
        self.hh_didSelectRowAtIndexPath(tableView, indexPath);
    }
}
#pragma mark - 头，脚视图
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return self.hh_heightForHeader ? self.hh_heightForHeader(tableView,section) : 0;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return self.hh_viewForHeader ? self.hh_viewForHeader(tableView,section) : [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return self.hh_heightForFooter ? self.hh_heightForFooter(tableView, section) : 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return self.hh_viewForFooter ? self.hh_viewForFooter(tableView,section) : [UIView new];
}

#pragma mark - 刷新tableView
- (void)hh_reloadData{
    [self reloadData];
}




@end
