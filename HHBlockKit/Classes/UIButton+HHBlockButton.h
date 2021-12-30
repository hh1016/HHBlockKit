//
//  UIButton+HHBlockButton.h
//  HHBlockKit
//
//  Created by lch on 2021/12/29.
//

#import <UIKit/UIKit.h>
#import "HHBlockHeader.h"
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, HHImagePosition) {
    HHImagePositionLeft = 0,  //default
    HHImagePositionTop,
    HHImagePositionRight,
    HHImagePositionBottom,
};

typedef UIButton *_Nullable (^HH_ButtonFrame)(CGRect rect);
typedef UIButton *_Nullable (^HH_ButtonBackgroundColor)(UIColor *color);
typedef UIButton *_Nullable (^HH_ButtonCornerRadius)(CGFloat cornerRadiusNum);
typedef UIButton *_Nullable (^HH_ButtonBorderWidth)(CGFloat borderWidthNum);
typedef UIButton *_Nullable (^HH_ButtonBorderColor)(UIColor *borderColor);

typedef UIButton *_Nullable (^HH_MasksToBounds)(BOOL masksToBounds);
typedef UIButton *_Nullable (^HH_SystemFont)(CGFloat systemFontNum);
typedef UIButton *_Nullable (^HH_BoldSystemFontNum)(CGFloat boldSystemFontNum);
typedef UIButton *_Nullable (^HH_TextNormal)(NSString *textString);
typedef UIButton *_Nullable (^HH_TextSelected)(NSString *textString);

typedef UIButton *_Nullable (^HH_TextColorNormal)(UIColor *textColor);
typedef UIButton *_Nullable (^HH_TextColorSelected)(UIColor *textSelectColor);
typedef UIButton *_Nullable (^HH_ImageColorNormal)(NSString *imageString);
typedef UIButton *_Nullable (^HH_ImageColorSelected)(NSString *imageSelectString);
typedef UIButton *_Nullable (^HH_BackgroundImageNormal)(NSString *imageString);

typedef UIButton *_Nullable (^HH_BackgroundImageSelected)(NSString *imageSelectString);
typedef UIButton *_Nullable (^HH_NumberOfLines)(NSInteger labelNumberOfLines);
typedef UIButton *_Nullable (^HH_ContentHorizontalAlignment)(UIControlContentHorizontalAlignment textAlignment);
typedef UIButton *_Nullable (^HH_ContentVerticalAlignment)(UIControlContentVerticalAlignment textAlignment);
typedef UIButton *_Nullable (^HH_AddTarget)(UIViewController *viewController,SEL action);

typedef UIButton *_Nullable (^HH_ImageDirectionalRect)(HHImagePosition position,CGFloat padding);



typedef void (^HHButtonClicked)(UIButton *__weak button);

@interface UIButton (HHBlockButton)


@property (nonatomic,copy,readonly) HH_ButtonFrame hh_frame;
@property (nonatomic,copy,readonly) HH_ButtonBackgroundColor hh_backgroundColor;
@property (nonatomic,copy,readonly) HH_ButtonCornerRadius hh_cornerRadius;
@property (nonatomic,copy,readonly) HH_ButtonBorderWidth hh_borderWidth;
@property (nonatomic,copy,readonly) HH_ButtonBorderColor hh_borderColor;
@property (nonatomic,copy,readonly) HH_MasksToBounds hh_masksToBounds;
@property (nonatomic,copy,readonly) HH_SystemFont hh_systemFont;
@property (nonatomic,copy,readonly) HH_BoldSystemFontNum hh_boldSystemFont;
@property (nonatomic,copy,readonly) HH_TextNormal hh_textNormal;
@property (nonatomic,copy,readonly) HH_TextSelected hh_textSelected;
@property (nonatomic,copy,readonly) HH_TextColorNormal hh_textColorNormal;
@property (nonatomic,copy,readonly) HH_TextColorSelected hh_textColorSelected;
@property (nonatomic,copy,readonly) HH_ImageColorNormal hh_imageColorNormal;
@property (nonatomic,copy,readonly) HH_ImageColorSelected hh_imageColorSelected;
@property (nonatomic,copy,readonly) HH_BackgroundImageNormal hh_backgroundImageNormal;
@property (nonatomic,copy,readonly) HH_BackgroundImageSelected hh_backgroundImageSelected;
@property (nonatomic,copy,readonly) HH_NumberOfLines hh_numberOfLines;
@property (nonatomic,copy,readonly) HH_ContentHorizontalAlignment hh_contentHorizontalAlignment;
@property (nonatomic,copy,readonly) HH_ContentVerticalAlignment hh_contentVerticalAlignment;
@property (nonatomic,copy,readonly) HH_AddTarget hh_addTarget;
@property (nonatomic,copy,readonly) HH_ImageDirectionalRect hh_ImageDirectionalRect;

- (void)hh_buttonClicked:(HHButtonClicked)buttonClickedBlock;

@end

NS_ASSUME_NONNULL_END
