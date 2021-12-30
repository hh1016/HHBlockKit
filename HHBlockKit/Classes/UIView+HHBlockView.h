//
//  UIView+HHBlockView.h
//  HHBlockKit
//
//  Created by lch on 2021/12/29.
//

#import <UIKit/UIKit.h>
#import "HHBlockHeader.h"
NS_ASSUME_NONNULL_BEGIN

typedef UIView *_Nullable (^HH_Frame)(CGRect rect);
typedef UIView *_Nullable (^HH_BackgroundColor)(UIColor *color);
typedef UIView *_Nullable (^HH_CornerRadius)(CGFloat cornerRadiusNum);
typedef UIView *_Nullable (^HH_BorderWidth)(CGFloat borderWidthNum);
typedef UIView *_Nullable (^HH_BorderColor)(UIColor *borderColor);


@interface UIView (HHBlockView)

@property (nonatomic,copy,readonly) HH_Frame hh_frame;
@property (nonatomic,copy,readonly) HH_BackgroundColor hh_backgroundColor;
@property (nonatomic,copy,readonly) HH_CornerRadius hh_cornerRadius;
@property (nonatomic,copy,readonly) HH_BorderColor hh_borderColor;
@property (nonatomic,copy,readonly) HH_BorderWidth hh_borderWidth;

@end

NS_ASSUME_NONNULL_END
