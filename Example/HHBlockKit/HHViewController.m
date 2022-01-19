//
//  HHViewController.m
//  HHKit
//
//  Created by hh1016 on 12/20/2021.
//  Copyright (c) 2021 hh1016. All rights reserved.
//

#import "HHViewController.h"
#import <HHBlockKit/HHBlockHeader.h>
#import<objc/runtime.h>


@interface HHViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) NSArray *array;
@property (nonatomic,strong) NSMutableArray *mArray;

@end

@implementation HHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc]init];
    [self.view addSubview:view];
    view.hh_frame(CGRectMake(50, 100, 100, 100))
        .hh_backgroundColor(UIColor.cyanColor)
        .hh_cornerRadius(10)
        .hh_borderColor(UIColor.redColor)
        .hh_borderWidth(1);

    UILabel *label = [[UILabel alloc]init];
    [self.view addSubview:label];
    label.hh_frame(CGRectMake(50, 250, 300, 50))
        .hh_backgroundColor(UIColor.cyanColor)
        .hh_text(@"这是一个label")
        .hh_systemFont(30)
        .hh_textAlignment(NSTextAlignmentCenter)
        .hh_borderWidth(1)
        .hh_borderColor(UIColor.redColor);

    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:but];
    but.hh_frame(CGRectMake(50, 350, 100, 100))
        .hh_textNormal(@"按钮")
        .hh_systemFont(18)
        .hh_backgroundColor(UIColor.cyanColor)
        .hh_textColorNormal(UIColor.redColor)
        .hh_cornerRadius(10)
        .hh_masksToBounds(YES)
        .hh_addTarget(self,@selector(butClicked))
        .hh_imageNormal(@"hh_icon");
    if (@available(iOS 15,*)) {
        but.hh_ImageDirectionalRectIOS15Later(NSDirectionalRectEdgeTop,10);
    }else{
        but.hh_ImageDirectionalRect(HHImagePositionTop,20);
    };
    
    [but hh_buttonClicked:^(UIButton * _Nonnull button) {
        NSLog(@"按钮点击了 ---- ");
    }];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    [self.view addSubview:imageView];
    imageView.hh_frame(CGRectMake(200, 350, 100, 100))
        .hh_image(@"qyCard_already")
        .hh_cornerRadius(5);

    UITextField *tf = [[UITextField alloc]init];
    [self.view addSubview:tf];
    tf.hh_frame(CGRectMake(50, 500, 300, 50))
        .hh_placeholderTextColor(@"请输入汉子",UIColor.cyanColor)
        .hh_textColor(UIColor.redColor)
        .hh_borderColor(UIColor.cyanColor)
        .hh_borderWidth(1)
        .hh_leftViewAndSapce(@"img_feedback_icon",10,10)
        .hh_leftViewMode(UITextFieldViewModeAlways)
        .hh_systemFont(20)
        .hh_keyboardType(UIKeyboardTypeDefault)
        .hh_returnKeyType(UIReturnKeyDone)
        .hh_addTarget(self,@selector(tfClicked:));
    [tf hh_textFieldDidChange:^(UITextField * _Nonnull textFiled) {

    }];
    
    tf.delegate = self;
    tf.hh_textFieldShouldBeginEditing = ^BOOL(UITextField *__weak  _Nonnull textFiled) {
        NSLog(@"textFiled 允许编辑");
        [textFiled resignFirstResponder];
        return YES;
    };
    tf.hh_textFieldDidEndEditing = ^(UITextField *__weak  _Nonnull textFiled) {

        if (textFiled.text.length > 5) {
            NSLog(@"大于5个字符");
        }
        NSLog(@"text -- %@",textFiled.text);
    };
    tf.hh_textFieldDidBeginEditing = ^(UITextField *__weak  _Nonnull textFiled) {
        NSLog(@"hh_textFieldDidBeginEditing -- %@",textFiled.text);
    };
    tf.hh_textFieldShouldEndEditing = ^BOOL(UITextField *__weak  _Nonnull textFiled) {
        NSLog(@"hh_textFieldShouldEndEditing - %@",textFiled.text);
        return YES;
    };
    tf.hh_textFieldDidChangeSelection = ^(UITextField *__weak  _Nonnull textFiled) {
        
        NSLog(@"hh_textFieldDidChangeSelection - %@",textFiled.text);
    };
    tf.hh_textFieldShouldReturn = ^BOOL(UITextField *__weak  _Nonnull textFiled) {
        [textFiled resignFirstResponder];
        return YES;
    };
    
    NSLog(@"%@",self.array);
    HHArray(self.array);
    HHMutableArray(self.mArray);
    [self.mArray addObject:@"1"];
    NSLog(@"%@ - %@",self.array,self.mArray);
}

- (void)butClicked{
    NSLog(@"点击按钮");
}
- (void)tfClicked:(UITextField *)textField{
    if (textField.markedTextRange == nil){
        NSLog(@"tf ---  %@",textField.text);
    }
}



@end
