//
//  UITableView+HHBlockTableView.h
//  HHBlockKit
//
//  Created by lch on 2021/12/29.
//

#import <UIKit/UIKit.h>
#import "HHBlockHeader.h"
NS_ASSUME_NONNULL_BEGIN

// 属性
typedef UITableView *_Nullable (^HH_TableViewFrame)(CGRect rect);
typedef UITableView *_Nullable (^HH_TableViewBackgroundColor)(UIColor *color);
typedef UITableView *_Nullable (^HH_TableViewCornerRadius)(CGFloat cornerRadiusNum);
typedef UITableView *_Nullable (^HH_TableViewBorderWidth)(CGFloat borderWidthNum);
typedef UITableView *_Nullable (^HH_TableViewBorderColor)(UIColor *borderColor);
typedef UITableView *_Nullable (^HH_TableViewRowHeight)(CGFloat rowHeight);
typedef UITableView *_Nullable (^HH_TableViewSectionHeaderHeight)(CGFloat sectionHeaderHeight);
typedef UITableView *_Nullable (^HH_TableViewSectionFooterHeight)(CGFloat sectionFooterHeight);
typedef UITableView *_Nullable (^HH_TableViewEstimatedRowHeight)(CGFloat estimatedRowHeight);
typedef UITableView *_Nullable (^HH_TableViewEstimatedSectionHeaderHeight)(CGFloat estimatedSectionHeaderHeight);
typedef UITableView *_Nullable (^HH_TableViewEstimatedSectionFooterHeight)(CGFloat estimatedSectionFooterHeight);
typedef UITableView *_Nullable (^HH_TableViewSectionHeaderTopPadding)(CGFloat sectionHeaderTopPadding);
typedef UITableView *_Nullable (^HH_TableViewRegisterClass)(id tableViewCell,NSString *reuseIdentifier);
typedef UITableView *_Nullable (^HH_TableViewRegisterNib)(id tableViewCell,NSString *reuseIdentifier);

/**
 数量
 */
typedef NSInteger (^HH_numberOfSection)(UITableView * __weak tableView);
typedef NSInteger (^HH_numberOfRow)(UITableView * __weak tableView,NSInteger section);
/**
 高度
 */
typedef CGFloat (^HH_heightForCell)(UITableView * __weak tableView,NSIndexPath *indexPath);
typedef CGFloat (^HH_heightForHeader)(UITableView * __weak  tableView,NSInteger section);
typedef CGFloat (^HH_heightForFooter)(UITableView * __weak tableView,NSInteger section);
/**
 视图
 */
typedef void (^HH_viewForCell)(UITableView * __weak  tableView,UITableViewCell *cell,NSIndexPath *indexPath);
typedef UIView *_Nullable(^HH_viewForHeader)(UITableView * __weak tableView,NSInteger section);
typedef UIView *_Nullable(^HH_viewForFooter)(UITableView * __weak tableView,NSInteger section);
/**
 cell点击
 */
typedef void (^HH_didSelectRowAtIndexPath)(UITableView * __weak tableView,NSIndexPath *indexPath);



@interface UITableView (HHBlockTableView)<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,copy,readonly) HH_TableViewFrame hh_frame;
@property (nonatomic,copy,readonly) HH_TableViewBackgroundColor hh_backgroundColor;
@property (nonatomic,copy,readonly) HH_TableViewCornerRadius hh_cornerRadius;
@property (nonatomic,copy,readonly) HH_TableViewBorderWidth hh_borderWidth;
@property (nonatomic,copy,readonly) HH_TableViewBorderColor hh_borderColor;
@property (nonatomic,copy,readonly) HH_TableViewRowHeight hh_rowHeight;
@property (nonatomic,copy,readonly) HH_TableViewSectionHeaderHeight hh_sectionHeaderHeight;
@property (nonatomic,copy,readonly) HH_TableViewSectionFooterHeight hh_sectionFooterHeight;
@property (nonatomic,copy,readonly) HH_TableViewEstimatedRowHeight hh_estimatedRowHeight;
@property (nonatomic,copy,readonly) HH_TableViewEstimatedSectionHeaderHeight hh_estimatedSectionHeaderHeight;
@property (nonatomic,copy,readonly) HH_TableViewEstimatedSectionFooterHeight hh_estimatedSectionFooterHeight;
@property (nonatomic,copy,readonly) HH_TableViewSectionHeaderTopPadding hh_sectionHeaderTopPadding;
@property (nonatomic,copy,readonly) HH_TableViewRegisterClass hh_registerClass;
@property (nonatomic,copy,readonly) HH_TableViewRegisterNib hh_registerNib;

#pragma mark - 代理方法
/**
 头视图
 */
@property (nonatomic,copy) HH_viewForHeader hh_viewForHeader ;
@property (nonatomic,copy) HH_heightForHeader hh_heightForHeader;

/**
 脚视图
 */
@property (nonatomic,copy) HH_heightForFooter hh_heightForFooter;
@property (nonatomic,copy) HH_viewForFooter hh_viewForFooter;
/**
 cell视图
 */
@property (nonatomic,copy) HH_numberOfSection hh_numberOfSection;
@property (nonatomic,copy) HH_numberOfRow hh_numberOfRow;
@property (nonatomic,copy) HH_heightForCell hh_heightForCell;
@property (nonatomic,copy) HH_viewForCell hh_viewForCell;
// cell row点击
@property(nonatomic,copy)  HH_didSelectRowAtIndexPath hh_didSelectRowAtIndexPath;



@end

NS_ASSUME_NONNULL_END
