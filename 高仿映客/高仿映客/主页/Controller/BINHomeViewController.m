//
//  BINHomeViewController.m
//  高仿映客
//
//  Created by 梦想 on 2016/11/9.
//  Copyright © 2016年 lin_tong. All rights reserved.
//

#import "BINHomeViewController.h"
#import <WMPageController.h>
#import "BINGZViewController.h"
#import "BINHotViewController.h"
#import "BINNewViewController.h"
@interface BINHomeViewController ()

@end

@implementation BINHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (instancetype)init{
    if (self = [super init]) {
        NSArray *classArr = @[[BINGZViewController class], [BINHotViewController class], [BINNewViewController class]];
        NSArray *titleArr = @[@"关注", @"热门", @"最新"];
        WMPageController *pager = [self initWithViewControllerClasses:classArr andTheirTitles:titleArr];
        pager.titleColorNormal = [UIColor whiteColor];
        pager.titleColorSelected = [UIColor whiteColor];
        pager.progressWidth = 25;
        pager.menuViewStyle = WMMenuViewStyleLine;
        pager.titleSizeSelected = 18;
        pager.showOnNavigationBar = YES;
        pager.menuBGColor = [UIColor clearColor];
        pager.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
        return (BINHomeViewController *)pager;
    }
    return nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
