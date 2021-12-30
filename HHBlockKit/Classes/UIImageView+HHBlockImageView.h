//
//  UIImageView+HHBlockImageView.h
//  HHBlockKit
//
//  Created by lch on 2021/12/29.
//

#import <UIKit/UIKit.h>
#import "HHBlockHeader.h"
NS_ASSUME_NONNULL_BEGIN

typedef UIImageView *_Nullable (^HH_ImageViewFrame)(CGRect rect);
typedef UIImageView *_Nullable (^HH_ImageViewBackgroundColor)(UIColor *color);
typedef UIImageView *_Nullable (^HH_ImageViewCornerRadius)(CGFloat cornerRadiusNum);
typedef UIImageView *_Nullable (^HH_ImageViewBorderWidth)(CGFloat borderWidthNum);
typedef UIImageView *_Nullable (^HH_ImageViewBorderColor)(UIColor *borderColor);
typedef UIImageView *_Nullable (^HH_ImageViewMasksToBounds)(BOOL masksToBounds);
typedef UIImageView *_Nullable (^HH_ImageViewImageString)(NSString *imageString);
typedef UIImageView *_Nullable (^HH_ImageViewImageData)(NSData *imageData);
typedef UIImageView *_Nullable (^HH_ImageViewUserInteractionEnabled)(BOOL userInteractionEnabled);

@interface UIImageView (HHBlockImageView)

@property (nonatomic,copy,readonly) HH_ImageViewFrame hh_frame;
@property (nonatomic,copy,readonly) HH_ImageViewBackgroundColor hh_backgroundColor;
@property (nonatomic,copy,readonly) HH_ImageViewCornerRadius hh_cornerRadius;
@property (nonatomic,copy,readonly) HH_ImageViewBorderWidth hh_borderWidth;
@property (nonatomic,copy,readonly) HH_ImageViewBorderColor hh_borderColor;
@property (nonatomic,copy,readonly) HH_ImageViewMasksToBounds hh_masksToBounds;
@property (nonatomic,copy,readonly) HH_ImageViewImageString hh_image;
@property (nonatomic,copy,readonly) HH_ImageViewImageData hh_imageData;
@property (nonatomic,copy,readonly) HH_ImageViewUserInteractionEnabled hh_userInteractionEnabled;




@end

NS_ASSUME_NONNULL_END
