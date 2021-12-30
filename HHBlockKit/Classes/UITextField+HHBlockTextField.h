//
//  UITextField+HHBlockTextField.h
//  HHBlockKit
//
//  Created by lch on 2021/12/29.
//

#import <UIKit/UIKit.h>
#import "HHBlockHeader.h"
NS_ASSUME_NONNULL_BEGIN
#pragma mark - 属性

typedef UITextField *_Nullable (^HH_TextFieldFrame)(CGRect rect);
typedef UITextField *_Nullable (^HH_TextFieldBackgroundColor)(UIColor *color);
typedef UITextField *_Nullable (^HH_TextFieldCornerRadius)(CGFloat cornerRadiusNum);
typedef UITextField *_Nullable (^HH_TextFieldBorderWidth)(CGFloat borderWidthNum);
typedef UITextField *_Nullable (^HH_TextFieldBorderColor)(UIColor *borderColor);
typedef UITextField *_Nullable (^HH_TextFieldBackgroundColor)(UIColor *color);
typedef UITextField *_Nullable (^HH_TextFieldCornerRadius)(CGFloat cornerRadiusNum);
typedef UITextField *_Nullable (^HH_TextFieldBorderWidth)(CGFloat borderWidthNum);
typedef UITextField *_Nullable (^HH_TextFieldSystemFont)(CGFloat systemFontNum);
typedef UITextField *_Nullable (^HH_TextFieldBoldSystemFont)(CGFloat boldSystemFontNum);
typedef UITextField *_Nullable (^HH_TextFieldPlaceholder)(NSString *placeholder);
typedef UITextField *_Nullable (^HH_TextFieldPlaceholderTextColor)(NSString *placeholder,UIColor *color);
typedef UITextField *_Nullable (^HH_TextFieldText)(NSString *textString);
typedef UITextField *_Nullable (^HH_TextFieldTextColor)(UIColor *color);


typedef UITextField *_Nullable (^HH_TextFieldTextAlignment)(NSTextAlignment textAlignment);
typedef UITextField *_Nullable (^HH_TextFieldLeftView)(UIView *leftView);
typedef UITextField *_Nullable (^HH_TextFieldRightView)(UIView *rightView);
typedef UITextField *_Nullable (^HH_TextFieldLeftViewMode)(UITextFieldViewMode leftViewMode);
typedef UITextField *_Nullable (^HH_TextFieldRightViewMode)(UITextFieldViewMode rightViewMode);
typedef UITextField *_Nullable (^HH_TextFieldLeftViewAndSapce)(NSString *imageString,CGFloat imageLeftSapce,CGFloat imageRightSapce);
typedef UITextField *_Nullable (^HH_TextFieldSecureTextEntry)(BOOL secureTextEntry);
typedef UITextField *_Nullable (^HH_TextFieldAddTarget)(UIViewController *viewController,SEL action);
typedef UITextField *_Nullable (^HH_TextFieldKeyboardType)(UIKeyboardType keyboardType);
typedef UITextField *_Nullable (^HH_TextFieldReturnKeyType)(UIReturnKeyType returnKeyType);


// textFiled 输入的监听
typedef void (^HHTextFieldDidChange)(UITextField * __weak textFiled);
#pragma mark - 代理方法
typedef BOOL(^HHTextFieldShouldBeginEditing)(UITextField * __weak textFiled);
typedef void(^HHTextFieldDidBeginEditing)(UITextField * __weak textFiled);
typedef BOOL(^HHTextFieldShouldEndEditing)(UITextField * __weak textFiled);
typedef void(^HHTextFieldDidEndEditing)(UITextField * __weak textFiled);

typedef BOOL(^HHShouldChangeCharactersInRange)(UITextField * __weak textFiled,NSString *replacementString);
typedef void(^HHTextFieldDidChangeSelection)(UITextField * __weak textFiled);
typedef BOOL(^HHTextFieldShouldClear)(UITextField * __weak textFiled);
typedef BOOL(^HHTextFieldShouldReturn)(UITextField * __weak textFiled);


@interface UITextField (HHBlockTextField)<UITextFieldDelegate>


@property (nonatomic,copy,readonly) HH_TextFieldFrame hh_frame;
@property (nonatomic,copy,readonly) HH_TextFieldText hh_text;
@property (nonatomic,copy,readonly) HH_TextFieldTextColor hh_textColor;
@property (nonatomic,copy,readonly) HH_TextFieldBackgroundColor hh_backgroundColor;
@property (nonatomic,copy,readonly) HH_TextFieldCornerRadius hh_cornerRadius;
@property (nonatomic,copy,readonly) HH_TextFieldBorderWidth hh_borderWidth;
@property (nonatomic,copy,readonly) HH_TextFieldBorderColor hh_borderColor;
@property (nonatomic,copy,readonly) HH_TextFieldSystemFont hh_systemFont;
@property (nonatomic,copy,readonly) HH_TextFieldBoldSystemFont hh_boldSystemFont;
@property (nonatomic,copy,readonly) HH_TextFieldPlaceholder hh_placeholder;
/**
 placeholder        提示语
 color              提示语字体颜色
 */
@property (nonatomic,copy,readonly) HH_TextFieldPlaceholderTextColor hh_placeholderTextColor;
@property (nonatomic,copy,readonly) HH_TextFieldTextAlignment hh_textAlignment;
@property (nonatomic,copy,readonly) HH_TextFieldLeftView hh_leftView;
@property (nonatomic,copy,readonly) HH_TextFieldRightView hh_rightView;
@property (nonatomic,copy,readonly) HH_TextFieldLeftViewMode hh_leftViewMode;
@property (nonatomic,copy,readonly) HH_TextFieldRightViewMode hh_rightViewMode;
@property (nonatomic,copy,readonly) HH_TextFieldLeftViewAndSapce hh_leftViewAndSapce;
@property (nonatomic,copy,readonly) HH_TextFieldSecureTextEntry hh_secureTextEntry;
@property (nonatomic,copy,readonly) HH_TextFieldAddTarget hh_addTarget;
@property (nonatomic,copy,readonly) HH_TextFieldKeyboardType hh_keyboardType;
@property (nonatomic,copy,readonly) HH_TextFieldReturnKeyType hh_returnKeyType;


/// 监听textFiled 输入
- (void)hh_textFieldDidChange:(HHTextFieldDidChange)textFieldDidChange;
/// 是否允许进入编辑状态
@property (nonatomic, copy) HHTextFieldShouldBeginEditing hh_textFieldShouldBeginEditing;
/// 已经进入编辑状态
@property (nonatomic, copy) HHTextFieldDidBeginEditing hh_textFieldDidBeginEditing;
/// 是否允许结束编辑
@property (nonatomic, copy) HHTextFieldShouldEndEditing hh_textFieldShouldEndEditing;
/// 完成编辑
@property (nonatomic, copy) HHTextFieldDidEndEditing hh_textFieldDidEndEditing;
/// 替换已有字符串的方法
@property (nonatomic, copy) HHShouldChangeCharactersInRange hh_shouldChangeCharactersInRange;
@property (nonatomic, copy) HHTextFieldDidChangeSelection hh_textFieldDidChangeSelection;
/// 是否允许清空已有文本内容
@property (nonatomic, copy) HHTextFieldShouldClear hh_textFieldShouldClear;
/// 询问代理对象是否返回,那其实就是点击return 就会自动调用此方法
@property (nonatomic, copy) HHTextFieldShouldReturn hh_textFieldShouldReturn;


@end

NS_ASSUME_NONNULL_END
