//
//  UIView+HHBlockView.m
//  HHBlockKit
//
//  Created by lch on 2021/12/29.
//

#import "UIView+HHBlockView.h"

@implementation UIView (HHBlockView)

- (HH_Frame)hh_frame{
    WS;
    return ^(CGRect rect){
        SS;
        strongSelf.frame = rect;
        return self;
    };
}
- (HH_BackgroundColor)hh_backgroundColor{
    WS;
    return ^(UIColor *color){
        SS;
        strongSelf.backgroundColor = color;
        return self;
    };
}
- (HH_CornerRadius)hh_cornerRadius{
    WS;
    return ^(CGFloat cornerRadiusNum){
        SS;
        strongSelf.layer.cornerRadius = cornerRadiusNum;
        return self;
    };
}
- (HH_BorderWidth)hh_borderWidth{
    WS;
    return ^(CGFloat borderWidthNum){
        SS;
        strongSelf.layer.borderWidth = borderWidthNum;
        return self;
    };
}
- (HH_BorderColor)hh_borderColor{
    WS;
    return ^(UIColor *borderColor){
        SS;
        strongSelf.layer.borderColor = borderColor.CGColor;
        return self;
    };
}


@end
