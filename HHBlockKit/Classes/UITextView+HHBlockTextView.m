//
//  UITextView+HHBlockTextView.m
//  HHBlockKit
//
//  Created by lch on 2021/12/29.
//

#import "UITextView+HHBlockTextView.h"

@implementation UITextView (HHBlockTextView)

- (HH_TextViewFrame)hh_frame{
    WS;
    return ^(CGRect rect){
        SS;
        strongSelf.frame = rect;
        return strongSelf;
    };
}
- (HH_TextViewBackgroundColor)hh_backgroundColor{
    WS;
    return ^(UIColor *color){
        SS;
        strongSelf.backgroundColor = color;
        return strongSelf;
    };
}
- (HH_TextViewCornerRadius)hh_cornerRadius{
    WS;
    return ^(CGFloat cornerRadiusNum){
        SS;
        strongSelf.layer.cornerRadius = cornerRadiusNum;
        return strongSelf;
    };
}
- (HH_TextViewBorderWidth)hh_borderWidth{
    WS;
    return ^(CGFloat borderWidthNum){
        SS;
        strongSelf.layer.borderWidth = borderWidthNum;
        return strongSelf;
    };
}
- (HH_TextViewBorderColor)hh_borderColor{
    WS;
    return ^(UIColor *borderColor){
        SS;
        strongSelf.layer.borderColor = borderColor.CGColor;
        return strongSelf;
    };
}

- (HH_TextViewText)hh_text{
    WS;
    return ^(NSString *textString){
        SS;
        strongSelf.text = textString;
        return strongSelf;
    };
}
- (HH_TextViewTextColor)hh_textColor{
    WS;
    return ^(UIColor *textColor){
        SS;
        strongSelf.textColor = textColor;
        return strongSelf;
    };
}
- (HH_TextViewTextAlignment)hh_textAlignment{
    WS;
    return ^(NSTextAlignment textAlignment){
        SS;
        strongSelf.textAlignment = textAlignment;
        return strongSelf;
    };
}

@end
