//
//  UILabel+HHBlockLabel.h
//  HHBlockKit
//
//  Created by lch on 2021/12/29.
//

#import <UIKit/UIKit.h>
#import "HHBlockHeader.h"
NS_ASSUME_NONNULL_BEGIN

typedef UILabel *_Nullable (^HH_LabelFrame)(CGRect rect);
typedef UILabel *_Nullable (^HH_LabelBackgroundColor)(UIColor *color);
typedef UILabel *_Nullable (^HH_LabelCornerRadius)(CGFloat cornerRadiusNum);
typedef UILabel *_Nullable (^HH_LabelBorderWidth)(CGFloat borderWidthNum);
typedef UILabel *_Nullable (^HH_LabelBorderColor)(UIColor *borderColor);
typedef UILabel *_Nullable (^HH_LabelSystemFont)(CGFloat systemFontNum);
typedef UILabel *_Nullable (^HH_LabelBoldSystemFont)(CGFloat boldSystemFontNum);
typedef UILabel *_Nullable (^HH_LabelTextString)(NSString *textString);
typedef UILabel *_Nullable (^HH_LabelTextColor)(UIColor *textColor);
typedef UILabel *_Nullable (^HH_LabelNumberOfLines)(NSInteger labelNumberOfLines);
typedef UILabel *_Nullable (^HH_LabelTextAlignment)(NSTextAlignment textAlignment);

@interface UILabel (HHBlockLabel)

@property (nonatomic,copy,readonly) HH_LabelFrame hh_frame;
@property (nonatomic,copy,readonly) HH_LabelBackgroundColor hh_backgroundColor;
@property (nonatomic,copy,readonly) HH_LabelCornerRadius hh_cornerRadius;
@property (nonatomic,copy,readonly) HH_LabelBorderWidth hh_borderWidth;
@property (nonatomic,copy,readonly) HH_LabelBorderColor hh_borderColor;
@property (nonatomic,copy,readonly) HH_LabelSystemFont hh_systemFont;
@property (nonatomic,copy,readonly) HH_LabelBoldSystemFont hh_boldSystemFont;
@property (nonatomic,copy,readonly) HH_LabelTextString hh_text;
@property (nonatomic,copy,readonly) HH_LabelTextColor hh_textColor;
@property (nonatomic,copy,readonly) HH_LabelNumberOfLines hh_numberOfLines;
@property (nonatomic,copy,readonly) HH_LabelTextAlignment hh_textAlignment;


@end

NS_ASSUME_NONNULL_END
