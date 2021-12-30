//
//  UITextView+HHBlockTextView.h
//  HHBlockKit
//
//  Created by lch on 2021/12/29.
//

#import <UIKit/UIKit.h>
#import "HHBlockHeader.h"
NS_ASSUME_NONNULL_BEGIN

typedef UITextView *_Nullable (^HH_TextViewFrame)(CGRect rect);
typedef UITextView *_Nullable (^HH_TextViewBackgroundColor)(UIColor *color);
typedef UITextView *_Nullable (^HH_TextViewCornerRadius)(CGFloat cornerRadiusNum);
typedef UITextView *_Nullable (^HH_TextViewBorderWidth)(CGFloat borderWidthNum);
typedef UITextView *_Nullable (^HH_TextViewBorderColor)(UIColor *borderColor);
typedef UITextView *_Nullable (^HH_TextViewText)(NSString *textString);
typedef UITextView *_Nullable (^HH_TextViewTextColor)(UIColor *textColor);
typedef UITextView *_Nullable (^HH_TextViewTextAlignment)(NSTextAlignment textAlignment);


@interface UITextView (HHBlockTextView)

@property (nonatomic,copy,readonly) HH_TextViewFrame hh_frame;
@property (nonatomic,copy,readonly) HH_TextViewBackgroundColor hh_backgroundColor;
@property (nonatomic,copy,readonly) HH_TextViewCornerRadius hh_cornerRadius;
@property (nonatomic,copy,readonly) HH_TextViewBorderWidth hh_borderWidth;
@property (nonatomic,copy,readonly) HH_TextViewBorderColor hh_borderColor;
@property (nonatomic,copy,readonly) HH_TextViewText hh_text;
@property (nonatomic,copy,readonly) HH_TextViewTextColor hh_textColor;
@property (nonatomic,copy,readonly) HH_TextViewTextAlignment hh_textAlignment;

@end

NS_ASSUME_NONNULL_END
