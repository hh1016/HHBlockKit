//
//  UILabel+HHBlockLabel.m
//  HHBlockKit
//
//  Created by lch on 2021/12/29.
//

#import "UILabel+HHBlockLabel.h"

@implementation UILabel (HHBlockLabel)

#pragma mark - UILabel 的方法
- (HH_LabelFrame)hh_frame{
    WS;
    return ^(CGRect rect){
        SS;
        strongSelf.frame = rect;
        return strongSelf;
    };
}
- (HH_LabelBackgroundColor)hh_backgroundColor{
    WS;
    return ^(UIColor *color){
        SS;
        strongSelf.backgroundColor = color;
        return strongSelf;
    };
}
- (HH_LabelCornerRadius)hh_cornerRadius{
    WS;
    return ^(CGFloat cornerRadiusNum){
        SS;
        strongSelf.layer.cornerRadius = cornerRadiusNum;
        return strongSelf;
    };
}
- (HH_LabelBorderWidth)hh_borderWidth{
    WS;
    return ^(CGFloat borderWidthNum){
        SS;
        strongSelf.layer.borderWidth = borderWidthNum;
        return strongSelf;
    };
}
- (HH_LabelBorderColor)hh_borderColor{
    WS;
    return ^(UIColor *borderColor){
        SS;
        strongSelf.layer.borderColor = borderColor.CGColor;
        return strongSelf;
    };
}
- (HH_LabelSystemFont)hh_systemFont{
    WS;
    return ^(CGFloat systemFontNum){
        SS;
        strongSelf.font = [UIFont systemFontOfSize:systemFontNum];
        return strongSelf;
    };
}
- (HH_LabelBoldSystemFont)hh_boldSystemFont{
    WS;
    return ^(CGFloat boldSystemFontNum){
        SS;
        strongSelf.font = [UIFont boldSystemFontOfSize:boldSystemFontNum];
        return strongSelf;
    };
}
- (HH_LabelTextString)hh_text{
    WS;
    return ^(NSString *textString){
        SS;
        strongSelf.text = textString;
        return strongSelf;
    };
}
- (HH_LabelTextColor)hh_textColor{
    WS;
    return ^(UIColor *textColor){
        SS;
        strongSelf.textColor = textColor;
        return strongSelf;
    };
}
- (HH_LabelNumberOfLines)hh_numberOfLines{
    WS;
    return ^(NSInteger labelNumberOfLines){
        SS;
        strongSelf.numberOfLines = labelNumberOfLines;
        return strongSelf;
    };
}
- (HH_LabelTextAlignment)hh_textAlignment{
    WS;
    return ^(NSTextAlignment textAlignment){
        SS;
        strongSelf.textAlignment = textAlignment;
        return strongSelf;
    };
}

@end
