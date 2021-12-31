# HHBlockKit
## 介绍
  基于UIKit封装的基础控件库，使用链式编程思想对常用的控件进行封装,包含UIView,UILabel,UIButton,UITextFiled,UITextView,UITableView的封装

## 安装
'''
pod 'HHBlockKit'
或者是  pod 'HHBlockKit',:git => 'https://github.com/hh1016/HHBlockKit.git' 
或者是  pod 'HHBlockKit',:git => 'https://gitee.com/hh1016/hhblockkit.git'  // 这个是码云的地址
'''
## 使用方式
UIView的使用
  UIView *view = [[UIView alloc]init];
  [self.view addSubview:view];
   view.hh_frame(CGRectMake(50, 100, 100, 100))
       .hh_backgroundColor(UIColor.cyanColor)
       .hh_cornerRadius(10)
       .hh_borderColor(UIColor.redColor)
       .hh_borderWidth(1);
UILabel的使用
  UILabel *label = [[UILabel alloc]init];
  [self.view addSubview:label];
  label.hh_frame(CGRectMake(50, 250, 300, 50))
        .hh_backgroundColor(UIColor.cyanColor)
        .hh_text(@"这是一个label")
        .hh_systemFont(30)
        .hh_textAlignment(NSTextAlignmentCenter)
        .hh_borderWidth(1)
        .hh_borderColor(UIColor.redColor);  
 还封装了其他属性，这里不一一列举了，用的时候自己查   ![image](https://user-images.githubusercontent.com/18042580/147797548-32b006a4-1dc7-4ee0-9b0f-b9ba1a41ae2e.png)
 .hh_xxxx()括号中会有参数的提示
 UIButton 的使用
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
        .hh_imageColorNormal(@"img_feedback_icon");
    // 实现图标和字 上下，左右，布局    
    if (@available(iOS 15,*)) {
        // ios 15以后用这个方法
        but.hh_ImageDirectionalRectIOS15Later(NSDirectionalRectEdgeTop,10);
    }else{
        // ios 15以前用这个方法
        but.hh_ImageDirectionalRect(HHImagePositionTop,20);
    };
    // 实现点击方法有一下俩种方法
    // .hh_addTarget(self,@selector(butClicked)) 
    - (void)butClicked{
      NSLog(@"点击按钮");
    }
    // block 调用
    [but hh_buttonClicked:^(UIButton * _Nonnull button) {
        NSLog(@"按钮点击了 ---- ");
    }];
    
UIImageView的使用
    UIImageView *imageView = [[UIImageView alloc]init];
    [self.view addSubview:imageView];
    imageView.hh_frame(CGRectMake(200, 350, 100, 100))
        .hh_image(@"qyCard_already")
        .hh_cornerRadius(5);

UItextFiled的使用
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
        .hh_returnKeyType(UIReturnKeyDone);
      
    // 两种方式 监听输入框的输入 
    tf.hh_addTarget(self,@selector(tfClicked:));
    - (void)tfClicked:(UITextField *)textField{
        if (textField.markedTextRange == nil){
            NSLog(@"tf ---  %@",textField.text);
        }
    }
    [tf hh_textFieldDidChange:^(UITextField * _Nonnull textFiled) {
        //逻辑处理
    }];
    // 下面是封装的textFiled的代理方法，全用block 实现
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

UITableView 的使用

    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    // 属性的使用
    tableView.hh_frame(CGRectMake(0, 100, SCREENWIDTH, SCREENHEIGHT - 100))
             .hh_registerClass([UITableViewCell class],@"cell")
             .hh_rowHeight(50);
    // 代理方法的封装使用        
    tableView.hh_numberOfRow = ^NSInteger(UITableView *__weak  _Nonnull tableView, NSInteger section) {
        return 10;
    };
    tableView.hh_viewForCell = ^(UITableView *__weak  _Nonnull tableView, UITableViewCell * _Nonnull cell, NSIndexPath * _Nonnull indexPath) {
        
        cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    };
    tableView.hh_didSelectRowAtIndexPath = ^(UITableView *__weak  _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"点击了第%ld行",indexPath.row);
    };
    tableView.hh_heightForHeader = ^CGFloat(UITableView *__weak  _Nonnull tableView, NSInteger section) {
        return 100;
    };
    tableView.hh_viewForHeader = ^UIView * _Nullable(UITableView *__weak  _Nonnull tableView, NSInteger section) {
        UIView *view = [[UIView alloc]init];
        view.hh_backgroundColor(UIColor.cyanColor);
        return view;
    };
    
