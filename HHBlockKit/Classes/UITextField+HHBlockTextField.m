//
//  UITextField+HHBlockTextField.m
//  HHBlockKit
//
//  Created by lch on 2021/12/29.
//

#import "UITextField+HHBlockTextField.h"
#import <objc/runtime.h>

static void *HHBlockTextFieldShouldBeginEditing = &HHBlockTextFieldShouldBeginEditing;
static void *HHBlockTextFieldDidBeginEditing = &HHBlockTextFieldDidBeginEditing;
static void *HHBlockTextFieldShouldEndEditing = &HHBlockTextFieldShouldEndEditing;
static void *HHBlockTextFieldDidEndEditing = &HHBlockTextFieldDidEndEditing;
static void *HHBlockShouldChangeCharactersInRange = &HHBlockShouldChangeCharactersInRange;
static void *HHBlockTextFieldDidChangeSelection = &HHBlockTextFieldDidChangeSelection;
static void *HHBlockTextFieldShouldClear = &HHBlockTextFieldShouldClear;
static void *HHBlockTextFieldShouldReturn = &HHBlockTextFieldShouldReturn;

@implementation UITextField (HHBlockTextField)

#pragma mark - UITextField 的方法
- (HH_TextFieldFrame)hh_frame{
    WS;
    return ^(CGRect rect){
        SS;
        strongSelf.frame = rect;
        strongSelf.autocorrectionType = UITextAutocorrectionTypeNo;
        strongSelf.autocapitalizationType = UITextAutocapitalizationTypeNone;
        strongSelf.clearButtonMode = UITextFieldViewModeWhileEditing;
        return strongSelf;
    };
}
- (HH_TextFieldText)hh_text{
    WS;
    return ^(NSString *textString){
        SS;
        strongSelf.text = textString;
        return strongSelf;
    };
}
- (HH_TextFieldTextColor)hh_textColor{
    WS;
    return ^(UIColor *color){
        SS;
        strongSelf.textColor = color;
        return strongSelf;
    };
}
- (HH_TextFieldBackgroundColor)hh_backgroundColor{
    WS;
    return ^(UIColor *color){
        SS;
        strongSelf.backgroundColor = color;
        return strongSelf;
    };
}
- (HH_TextFieldCornerRadius)hh_cornerRadius{
    WS;
    return ^(CGFloat cornerRadiusNum){
        SS;
        strongSelf.layer.cornerRadius = cornerRadiusNum;
        return strongSelf;
    };
}
- (HH_TextFieldBorderWidth)hh_borderWidth{
    WS;
    return ^(CGFloat borderWidthNum){
        SS;
        strongSelf.layer.borderWidth = borderWidthNum;
        return strongSelf;
    };
}
- (HH_TextFieldBorderColor)hh_borderColor{
    WS;
    return ^(UIColor *borderColor){
        SS;
        strongSelf.layer.borderColor = borderColor.CGColor;
        return strongSelf;
    };
}
- (HH_TextFieldSystemFont)hh_systemFont{
    WS;
    return ^(CGFloat systemFontNum){
        SS;
        strongSelf.font = [UIFont systemFontOfSize:systemFontNum];
        return strongSelf;
    };
}
- (HH_TextFieldBoldSystemFont)hh_boldSystemFont{
    WS;
    return ^(CGFloat boldSystemFontNum){
        SS;
        strongSelf.font = [UIFont boldSystemFontOfSize:boldSystemFontNum];
        return strongSelf;
    };
}
- (HH_TextFieldPlaceholder)hh_placeholder{
    WS;
    return ^(NSString *placeholder){
        SS;
        strongSelf.placeholder = placeholder;
        return strongSelf;
    };
}
/**
 placeholder        提示语
 color              提示语字体颜色
 */
- (HH_TextFieldPlaceholderTextColor)hh_placeholderTextColor{
    WS;
    return ^(NSString *placeholder,UIColor *color){
        SS;
        strongSelf.placeholder = placeholder;
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:placeholder attributes:
            @{NSForegroundColorAttributeName:color}];
        strongSelf.attributedPlaceholder = attrString;
        return strongSelf;
    };
}
- (HH_TextFieldTextAlignment)hh_textAlignment{
    WS;
    return ^(NSTextAlignment textAlignment){
        SS;
        strongSelf.textAlignment = textAlignment;
        return strongSelf;
    };
}
- (HH_TextFieldLeftView)hh_leftView{
    WS;
    return ^(UIView *leftView){
        SS;
        strongSelf.leftView = leftView;
        return strongSelf;
    };
}
- (HH_TextFieldRightView)hh_rightView{
    WS;
    return ^(UIView *rightView){
        SS;
        strongSelf.rightView = rightView;
        return strongSelf;
    };
}
- (HH_TextFieldLeftViewMode)hh_leftViewMode{
    WS;
    return ^(UITextFieldViewMode leftViewMode){
        SS;
        strongSelf.leftViewMode = leftViewMode;
        return strongSelf;
    };
}
- (HH_TextFieldRightViewMode)hh_rightViewMode{
    WS;
    return ^(UITextFieldViewMode rightViewMode){
        SS;
        strongSelf.rightViewMode = rightViewMode;
        return strongSelf;
    };
}
/**
 左边视图为imageView；
 imageString     图片名称
 imageLeftSapce  左边距
 imageRightSapce 右边距
 */
- (HH_TextFieldLeftViewAndSapce)hh_leftViewAndSapce{
    WS;
    return ^(NSString *imageString,CGFloat imageLeftSapce,CGFloat imageRightSapce){
        SS;
        UIImage *image = [UIImage imageNamed:imageString];
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0,imageLeftSapce + image.size.width + imageRightSapce, CGRectGetHeight(strongSelf.frame))];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(imageLeftSapce, CGRectGetHeight(strongSelf.frame)/2 - image.size.height/2, image.size.width, image.size.height)];
        imageView.image = image;
        [view addSubview:imageView];
        strongSelf.leftView = view;
        
        return strongSelf;
    };
}
- (HH_TextFieldSecureTextEntry)hh_secureTextEntry{
    WS;
    return ^(BOOL secureTextEntry){
        SS;
        strongSelf.secureTextEntry = secureTextEntry;
        return strongSelf;
    };
}

- (HH_TextFieldAddTarget)hh_addTarget{
    WS;
    return ^(UIViewController *viewController,SEL action){
        SS;
        [strongSelf addTarget:viewController action:action forControlEvents:UIControlEventEditingChanged];
        return strongSelf;
    };
}
- (HH_TextFieldKeyboardType)hh_keyboardType{
    WS;
    return ^(UIKeyboardType keyboardType){
        SS;
        strongSelf.keyboardType = keyboardType;
        return strongSelf;
    };
}
- (HH_TextFieldReturnKeyType)hh_returnKeyType{
    WS;
    return ^(UIReturnKeyType returnKeyType){
        SS;
        strongSelf.returnKeyType = returnKeyType;
        return strongSelf;
    };
}


- (void)hh_textFieldDidChange:(HHTextFieldDidChange)textFieldDidChange{
    if (textFieldDidChange) {
        objc_setAssociatedObject(self, @selector(textFieldDidChange:), textFieldDidChange, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
}
#pragma 监听输入框输入字符,输入完后再判断,做后续处理
- (void)textFieldDidChange:(UITextField *)textField{
    if (textField.markedTextRange == nil){
        HHTextFieldDidChange block = objc_getAssociatedObject(self, _cmd);
        if (block) {
            block(textField);
        }
    }
}
// 设置代理
- (void)configDelegate{
    if (self.delegate != self) {
        self.delegate = self;
    }
}

#pragma mark - hh_代理方法封装

/// 是否允许进入编辑状态
- (void)setHh_textFieldShouldBeginEditing:(HHTextFieldShouldBeginEditing)hh_textFieldShouldBeginEditing{
    NSAssert(hh_textFieldShouldBeginEditing, @"hh_textFieldShouldBeginEditing cannot be nil");
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockTextFieldShouldBeginEditing, hh_textFieldShouldBeginEditing, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
///// 已经进入编辑状态
- (void)setHh_textFieldDidBeginEditing:(HHTextFieldDidBeginEditing)hh_textFieldDidBeginEditing{
    NSAssert(hh_textFieldDidBeginEditing, @"hh_textFieldDidBeginEditing cannot be nil");
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockTextFieldDidBeginEditing, hh_textFieldDidBeginEditing,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

///// 是否允许结束编辑
- (void)setHh_textFieldShouldEndEditing:(HHTextFieldShouldEndEditing)hh_textFieldShouldEndEditing{
    NSAssert(hh_textFieldShouldEndEditing, @"hh_textFieldShouldEndEditing cannot be nil");
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockTextFieldShouldEndEditing, hh_textFieldShouldEndEditing, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
///// 完成编辑
- (void)setHh_textFieldDidEndEditing:(HHTextFieldDidEndEditing)hh_textFieldDidEndEditing{
    NSAssert(hh_textFieldDidEndEditing, @"hh_textFieldDidEndEditing cannot be nil");
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockTextFieldDidEndEditing, hh_textFieldDidEndEditing, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
///// 替换已有字符串的方法
- (void)setHh_shouldChangeCharactersInRange:(HHShouldChangeCharactersInRange)hh_shouldChangeCharactersInRange{
    NSAssert(hh_shouldChangeCharactersInRange, @"hh_shouldChangeCharactersInRange cannot be nil");
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockShouldChangeCharactersInRange, hh_shouldChangeCharactersInRange, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setHh_textFieldDidChangeSelection:(HHTextFieldDidChangeSelection)hh_textFieldDidChangeSelection{
    NSAssert(hh_textFieldDidChangeSelection, @"hh_textFieldDidChangeSelection cannot be nil");
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockTextFieldDidChangeSelection, hh_textFieldDidChangeSelection, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
///// 是否允许清空已有文本内容
- (void)setHh_textFieldShouldClear:(HHTextFieldShouldClear)hh_textFieldShouldClear{
    NSAssert(hh_textFieldShouldClear, @"hh_textFieldShouldClear cannot be nil");
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockTextFieldShouldClear, hh_textFieldShouldClear, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
///// 询问代理对象是否返回,那其实就是点击return 就会自动调用此方法
- (void)setHh_textFieldShouldReturn:(HHTextFieldShouldReturn)hh_textFieldShouldReturn{
    NSAssert(hh_textFieldShouldReturn, @"hh_textFieldShouldReturn cannot be nil");
    [self configDelegate];
    objc_setAssociatedObject(self, HHBlockTextFieldShouldReturn, hh_textFieldShouldReturn, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HHTextFieldShouldBeginEditing)hh_textFieldShouldBeginEditing{
    return objc_getAssociatedObject(self, HHBlockTextFieldShouldBeginEditing);
}
- (HHTextFieldDidBeginEditing)hh_textFieldDidBeginEditing{
    return objc_getAssociatedObject(self, HHBlockTextFieldDidBeginEditing);
}
- (HHTextFieldShouldEndEditing)hh_textFieldShouldEndEditing{
    return objc_getAssociatedObject(self, HHBlockTextFieldShouldEndEditing);
}
///// 完成编辑
- (HHTextFieldDidEndEditing)hh_textFieldDidEndEditing{
    return objc_getAssociatedObject(self, HHBlockTextFieldDidEndEditing);
}
///// 替换已有字符串的方法
- (HHShouldChangeCharactersInRange)hh_shouldChangeCharactersInRange{
    return objc_getAssociatedObject(self, HHBlockShouldChangeCharactersInRange);
}
- (HHTextFieldDidChangeSelection)hh_textFieldDidChangeSelection{
    return objc_getAssociatedObject(self, HHBlockTextFieldDidChangeSelection);
}
///// 是否允许清空已有文本内容
- (HHTextFieldShouldClear)hh_textFieldShouldClear{
    return objc_getAssociatedObject(self, HHBlockTextFieldShouldClear);
}
///// 询问代理对象是否返回,那其实就是点击return 就会自动调用此方法
- (HHTextFieldShouldReturn)hh_textFieldShouldReturn{
    return objc_getAssociatedObject(self, HHBlockTextFieldShouldReturn);
}


#pragma mark - UITextFiledDetagate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (self.hh_textFieldShouldBeginEditing) {
        return self.hh_textFieldShouldBeginEditing(textField);
    }
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (self.hh_textFieldDidBeginEditing) {
        self.hh_textFieldDidBeginEditing(textField);
    }
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if (self.hh_textFieldShouldEndEditing) {
        return self.hh_textFieldShouldEndEditing(textField);
    }
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (self.hh_textFieldDidEndEditing) {
        self.hh_textFieldDidEndEditing(textField);
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (self.hh_shouldChangeCharactersInRange) {
        return self.hh_shouldChangeCharactersInRange(textField, string);
    }
    return YES;
}
- (void)textFieldDidChangeSelection:(UITextField *)textField{
    if (self.hh_textFieldDidChangeSelection) {
        self.hh_textFieldDidChangeSelection(textField);
    }
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    if (self.hh_textFieldShouldClear) {
        return self.hh_textFieldShouldClear(textField);
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (self.hh_textFieldShouldReturn) {
        return self.hh_textFieldShouldReturn(textField);
    }
    return YES;
}

@end
