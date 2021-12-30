//
//  HHMacro.h
//  Pods
//
//  Created by lch on 2021/12/22.
//

#ifndef HHMacro_h
#define HHMacro_h

//屏高宽
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
//颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b)  RGBA(r,g,b,1.0f)
// 字符串不为空
#define HHStringIsNotEmpty(__string)  (!HHStringIsEmpty(__string))
// 字符串为空
#define HHStringIsEmpty(__string) ((__string.length == 0) || HHObjectIsNil(__string) || [__string rangeOfString:@"null"].location != NSNotFound)
// 是否为空对象
#define HHObjectIsNil(__object)  ((nil == __object) || [__object isKindOfClass:[NSNull class]])

// 是否是x系列手机
#define kDevice_Is_iPhoneX \
            ({BOOL isPhoneX = NO;\
                if (@available(iOS 11.0, *)) {\
                isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
                }\
            (isPhoneX);})

#define HHNavHeight   ((kDevice_Is_iPhoneX) ? 88.0 : 64.0)
#define HHTabBarHeight     ((kDevice_Is_iPhoneX) ? 83.0 : 49.0)
#define HHTabBarSafeAreaHeight     ((kDevice_Is_iPhoneX) ? 34.0 : 0.0)
#define HHNavBarSafeAreaHeight       ((kDevice_Is_iPhoneX) ? 44.0 : 20.0)

// 字体
#define HHPingFangSCRegular(x)       [UIFont fontWithName:@"PingFangSC-Regular" size:x]
#define HHPingFangSCMedium(x)        [UIFont fontWithName:@"PingFangSC-Medium" size:x]
#define HHPingFangSCBold(x)          [UIFont fontWithName:@"PingFangSC-Semibold" size:x]

// 创建数组
#define HHArray(value)  if (!value) {\
                            value = [[NSArray alloc]init];\
                        }
// 创建可变数组
#define HHMutableArray(value)   if (!value) {\
                                    value = [[NSMutableArray alloc]init];\
                                }
// 创建字典
#define HHDictionary(value)  if (!value) {\
                            value = [[NSDictionary alloc]init];\
                        }
// 创建可变字典
#define HHMutableDictionary(value) if (!value) {value = [[NSMutableDictionary alloc]init];}

// 封装Alert
CG_INLINE UIAlertController * _Nullable HH_showAlert(UIViewController * _Nullable vc, NSString * _Nullable title,
        NSString * _Nullable message,
        NSString * _Nullable buttonTitle1,
        NSString * _Nullable buttonTitle2,
        dispatch_block_t _Nullable buttonTitle1Handler,
        dispatch_block_t _Nullable buttonTitle2Handler) {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        UIPopoverPresentationController *pop = [alertController popoverPresentationController];
        pop.permittedArrowDirections = UIPopoverArrowDirectionAny;
        pop.sourceView = vc.view;
        pop.sourceRect = vc.view.bounds;
    }
    
    if (buttonTitle1) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:buttonTitle1 style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (buttonTitle1Handler) buttonTitle1Handler();
        }];
        [alertController addAction:cancelAction];
    }
    if (buttonTitle2) {
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:buttonTitle2 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (buttonTitle2Handler) buttonTitle2Handler();
        }];
        [alertController addAction:okAction];
    }
    [vc presentViewController:alertController animated:YES completion:nil];
    return alertController;
}


#endif /* HHMacro_h */

// NSLog
#ifdef DEBUG //开发阶段
#define HHLog(format,...) printf("%s \n",[[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String])
#else //发布阶段
#define HHLog(...)
#endif /* HHMacro_h */
