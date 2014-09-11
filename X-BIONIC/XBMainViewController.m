//
//  XBMainViewController.m
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-8-28.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import "XBUserLoginViewController.h"
#import "XBAcitvityViewController.h"
#import "XBProductBuyViewController.h"
#import "XBStoryViewController.h"
#import "XBIntroduceViewController.h"
#import "SYdefine.h"
#import "XBMainViewController.h"

@interface XBMainViewController ()
{
    NSInteger _kPages;
    UIButton *_button;
}

@property (nonatomic, strong) UIToolbar      *homepageToolBar;// 首页的工具栏
@property (nonatomic, strong) UIImageView    *homepageBackgroundImageView;// 首页的背景图片
@property (nonatomic, strong) UIScrollView   *homepageScrollView;// 首页的scrollview
@property (nonatomic, strong) NSMutableArray *homepageImagesArray;// 存储首页滚动的图片
@property (nonatomic, strong) UIImageView    *homepageScrollImageView;// 放置滚动图片

@end

@implementation XBMainViewController

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
    
    // 初始化首页背景图片
    [self initHomepageBackgroundImageView];

    // 初始化首页的ScrollerView
    [self initHomepageScrollView];
    
    // 导航栏左右按钮
    [self setBarButtonItem];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 首页背景图片
/**
 *  初始化首页背景图片
 */
- (void)initHomepageBackgroundImageView
{
    // 初始化ImageView
    self.homepageBackgroundImageView = [[UIImageView alloc] initWithFrame:
                                        CGRectMake(0,
                                                   0,
                                                   self.view.frame.size.width,
                                                   self.view.frame.size.height - kNAVIGATION_HEIGHT)];
    // 设置图片
    [self.homepageBackgroundImageView setImage:[UIImage imageNamed:@"homeBackground"]];
    // 让ImageView显示在屏幕上
    [self.view addSubview:self.homepageBackgroundImageView];
}

#pragma mark - 首页滚动视图
/**
 *  初始化
 */
- (void)initHomepageScrollView
{
    // 设置边框
    self.homepageScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    // 自动调整子控件与父控件中间的位置,宽高
    self.homepageScrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    // 设置委托
    self.homepageScrollView.delegate = self;
    // 让整页滚动
    self.homepageScrollView.pagingEnabled = YES;
    // 锁定垂直移动
    self.homepageScrollView.directionalLockEnabled = NO;
   
    // 初始化数组，存储滚动视图的图片
    self.homepageImagesArray = [[NSMutableArray alloc] initWithCapacity:8];
    self.homepageImagesArray = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"XStoryPage"],
                                                                [UIImage imageNamed:@"XIntroducePage"],
                                                                [UIImage imageNamed:@"XActivtyPage"],
                                                                [UIImage imageNamed:@"XProductPage"],
                                                                [UIImage imageNamed:@"XStoryPage"],
                                                                [UIImage imageNamed:@"XIntroducePage"],nil];

    // 图片的页数
    _kPages = [self.homepageImagesArray count];
    //设置滚动视图的位置
    [self.homepageScrollView setContentSize:CGSizeMake(self.view.frame.size.width * _kPages,
                                                       self.homepageScrollView.bounds.size.height - 64)];
    [self.homepageScrollView scrollRectToVisible:self.view.frame animated:YES];
    // 把scrollview加入当前视图中
    [self.view addSubview:self.homepageScrollView];
    for (int i = 0; i < _kPages; i++) {
        // 把图片加入滚动视图中
        self.homepageScrollImageView       = [[UIImageView alloc] initWithFrame:self.view.frame];
   
        self.homepageScrollImageView.image = self.homepageImagesArray[i];
        self.homepageScrollImageView.frame = CGRectMake(self.view.frame.size.width * i,
                                                        -100,
                                                        self.view.frame.size.width,
                                                        self.view.frame.size.height);
        
        // 给每个视图添加一个按钮
        _button       = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _button.frame = CGRectMake(self.view.frame.size.width * i,
                                  -100,
                                  self.view.frame.size.width,
                                  self.view.frame.size.height);
        [_button setTitle:@" " forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];

        // 把按钮和图片都加入滚动视图中
        [self.homepageScrollView addSubview:_button];
        [self.homepageScrollView addSubview:self.homepageScrollImageView];
    }
    // 设置开始显示的图片
    CGPoint point =  self.homepageScrollView.contentOffset;
    point.x = kFIRST_PAGE;
    self.homepageScrollView.contentOffset = point;
}

/**
 *  让scrollview循环滚动
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.homepageScrollView.contentOffset.x == 1600) {
        CGPoint point =  self.homepageScrollView.contentOffset;
        point.x = 320;
        self.homepageScrollView.contentOffset = point;
    }
    else if (self.homepageScrollView.contentOffset.x == 0) {
        CGPoint point = self.homepageScrollView.contentOffset;
        point.x = 1280;
        self.homepageScrollView.contentOffset = point;
    }
    NSLog(@" = %f", self.homepageScrollView.contentOffset.x);
}


/**
 *  按钮点击事件
 */
- (void)clickButton
{
    // 根据点击的不同位置，进入不同的页面。
    switch ((int)self.homepageScrollView.contentOffset.x) {
        case 320: {
            XBIntroduceViewController *introduceVC = [[XBIntroduceViewController alloc] init];
            [self.navigationController pushViewController:introduceVC animated:YES];
        }
            break;
        case 640: {
            XBAcitvityViewController *activityVC = [[XBAcitvityViewController alloc] init];
            [self.navigationController pushViewController:activityVC animated:YES];
        }
            break;
        case 960: {
            XBProductBuyViewController *productBuyVC = [[XBProductBuyViewController alloc] init];
            [self.navigationController pushViewController:productBuyVC animated:YES];
        }
            break;
        case 1280: {
            XBStoryViewController *storyVC = [[XBStoryViewController alloc] init];
            [self.navigationController pushViewController:storyVC animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark - 导航栏按钮和背景

/**
 *  设置导航栏按钮
 */
- (void)setBarButtonItem
{
    // 设置导航栏背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"topNav"]
                                                  forBarMetrics:UIBarMetricsDefault];
    // 设置状态栏风格
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
    // 设置左按钮图片和动作
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithImage:[UIImage imageNamed:@"personPicture"]
                                                     style:UIBarButtonItemStylePlain
                                                    target:self
                                                    action:@selector(clickUserCenter)];
    // 设置右按钮图片和动作
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithImage:[UIImage imageNamed:@"searchBtnPic"]
                                                      style:UIBarButtonItemStylePlain
                                                     target:self
                                                     action:@selector(clickSearchButton)];
    
    // 初始化图片视图控件
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:LOCATION_OF_NAVIGATIONTITLE];
    // 设置内容样式，通过保持长宽比缩放内容适应视图的大小，任何剩余的区域的视图的界限是透明的。
    imageView.contentMode = UIViewContentModeLeft;
    // 初始化图像视图
    UIImage *titleImage = [UIImage imageNamed:@"navBuloLogo"];
    // 让图片显示在视图控件上面
    [imageView setImage:titleImage];
    // 把导航栏标题按钮用图片代替
    self.navigationItem.titleView = imageView;
}

/**
 *  点击导航栏左按钮（用户中心）动作
 */
- (void)clickUserCenter
{
    XBUserLoginViewController *userCenterVC = [[XBUserLoginViewController alloc] init];
    UINavigationController *loginNC = [[UINavigationController alloc] initWithRootViewController:userCenterVC];
    [self presentViewController:loginNC animated:YES completion:nil];
}

/**
 *  点击导航栏右按钮（）动作
 */
- (void)clickSearchButton
{
    
}

@end
