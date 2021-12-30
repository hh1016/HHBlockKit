//
//  UIImageView+HHBlockImageView.m
//  HHBlockKit
//
//  Created by lch on 2021/12/29.
//

#import "UIImageView+HHBlockImageView.h"

@implementation UIImageView (HHBlockImageView)
- (HH_ImageViewFrame)hh_frame{
    WS;
    return ^(CGRect rect){
        SS;
        strongSelf.frame = rect;
        return strongSelf;
    };
}
- (HH_ImageViewBackgroundColor)hh_backgroundColor{
    WS;
    return ^(UIColor *color){
        SS;
        strongSelf.backgroundColor = color;
        return strongSelf;
    };
}
- (HH_ImageViewCornerRadius)hh_cornerRadius{
    WS;
    return ^(CGFloat cornerRadiusNum){
        SS;
        strongSelf.layer.cornerRadius = cornerRadiusNum;
        return strongSelf;
    };
}
- (HH_ImageViewBorderWidth)hh_borderWidth{
    WS;
    return ^(CGFloat borderWidthNum){
        SS;
        strongSelf.layer.borderWidth = borderWidthNum;
        return strongSelf;
    };
}
- (HH_ImageViewBorderColor)hh_borderColor{
    WS;
    return ^(UIColor *borderColor){
        SS;
        strongSelf.layer.borderColor = borderColor.CGColor;
        return strongSelf;
    };
}
- (HH_ImageViewMasksToBounds)hh_masksToBounds{
    WS;
    return ^(BOOL masksToBounds){
        SS;
        strongSelf.layer.masksToBounds = masksToBounds;
        return strongSelf;
    };
}
- (HH_ImageViewImageString)hh_image{
    WS;
    return ^(NSString *imageString){
        SS;
        strongSelf.image = [UIImage imageNamed:imageString];
        return strongSelf;
    };
}
- (HH_ImageViewImageData)hh_imageData{
    WS;
    return ^(NSData *imageData){
        SS;
        strongSelf.image = [UIImage imageWithData:imageData];
        return strongSelf;
    };
}
- (HH_ImageViewUserInteractionEnabled)hh_userInteractionEnabled{
    WS;
    return ^(BOOL userInteractionEnabled){
        SS;
        strongSelf.userInteractionEnabled = userInteractionEnabled;
        return strongSelf;
    };
}
@end
