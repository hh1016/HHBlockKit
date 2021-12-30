//
//  HHFirendVC.m
//  HHKit_Example
//
//  Created by lch on 2021/12/20.
//  Copyright © 2021 hh1016. All rights reserved.
//

#import "HHFirendVC.h"
#import <HHBlockKit/HHBlockHeader.h>
#import "HHTableViewCell.h"


@interface HHFirendVC ()

@end

@implementation HHFirendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.hh_frame(CGRectMake(0, 100, SCREENWIDTH, SCREENHEIGHT - 100))
             .hh_registerClass([UITableViewCell class],@"cell")
             .hh_rowHeight(50);
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
    
}

@end
