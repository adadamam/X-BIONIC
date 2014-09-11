//
//  DetailViewController.m
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-9-2.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import "SYdefine.h"
#import "SYModel.h"
#import "XBDetailViewController.h"

@interface XBDetailViewController ()

@end

@implementation XBDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 导航栏和标题
    [self initNavigation];
    
    // 载入介绍
    [self loadIntroduce];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 导航栏
/**
 *  导航栏按钮和标题
 */
- (void)initNavigation
{
    // 设置返回按钮的背景图片和点击动作
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backButtonPic"] style:UIBarButtonItemStylePlain target:self action:@selector(clickBackButton)];
}

/**
 *  点击返回按钮动作
 */
- (void)clickBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 载入介绍

/**
 *  载入介绍文字
 */
- (void)loadIntroduce
{
    // 设置背景图片
    UIColor *backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    [self.view setBackgroundColor:backgroundColor];
    
    UIImage *introduceImage = [UIImage imageNamed:[[SYModel shareInstance] displayImage]];

    UIScrollView *introduceImageSV = [[UIScrollView alloc]
                                      initWithFrame:CGRectMake(0,
                                                               0,
                                                               self.view.frame.size.width,
                                                               introduceImage.size.height)];
    
    // 设置图片视图的大小
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                           0,
                                                                           self.view.frame.size.width,
                                                                           introduceImage.size.height +
                                                                           kNAVIGATION_HEIGHT)];
    introduceImageSV.contentSize = CGSizeMake(320,introduceImage.size.height * 2 - (480 - 64));
    [imageView setImage:introduceImage];
    [introduceImageSV addSubview:imageView];
    [self.view addSubview:introduceImageSV];


}

@end
