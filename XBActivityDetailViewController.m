//
//  XBActivityDetailViewController.m
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-9-4.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "SYModelData.h"
#import "SYModel.h"
#import "XBActivityDetailViewController.h"

@interface XBActivityDetailViewController ()
{
    UIScrollView *_scrollView;
}

@end

@implementation XBActivityDetailViewController

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
    
    [self initNavigationBar];
    [self displayContent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// TODO:-----------导航栏
/**
 *  导航栏
 */
- (void)initNavigationBar
{
    self.navigationItem.title = @"活动详情";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backButtonPic"]
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(clickBackButton)];
}

/**
 *  返回活动页面
 */
- (void)clickBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

// TODO:-------页面内容-------
/**
 *  显示详情
 */
- (void)displayContent
{
    // 创建一个scrollView
    _scrollView             = [[UIScrollView alloc] initWithFrame:CGRectMake(0,
                                                                             0,
                                                                             self.view.frame.size.width *2,
                                                                             self.view.frame.size.height)];
    _scrollView.contentSize = CGSizeMake(320 * 2,
                                         self.view.frame.size.height);
    _scrollView.delegate    = self;
    
    // 创建两个View构成scrollView
    UIImageView *firstView                = [[UIImageView alloc] initWithFrame:self.view.frame];
    UILabel *activityTitle =[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 250, 25)];
    UILabel *activityTime                 = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, 250, 25)];
    UIImageView *titleImageUrl            = [[UIImageView alloc] initWithFrame:CGRectMake(10, 68, 300, 170)];
    firstView.image                       = [UIImage imageNamed:@"allbackground"];
    
    // 详细内容得创建
    UILabel *address                      = [[UILabel alloc] initWithFrame:CGRectMake(10, 260, self.view.frame.size.width, 25)];
    UILabel *userName                     = [[UILabel alloc] initWithFrame:CGRectMake(10, 285, self.view.frame.size.width, 25)];
    UILabel *organizer                    = [[UILabel alloc] initWithFrame:CGRectMake(10, 310, self.view.frame.size.width, 25)];
    UILabel *signUpDeadLine=[[UILabel alloc] initWithFrame:CGRectMake(10, 335, self.view.frame.size.width, 25)];
    UILabel *activityType                 = [[UILabel alloc] initWithFrame:CGRectMake(10, 360, self.view.frame.size.width, 25)];
    UILabel *isJoin                       = [[UILabel alloc] initWithFrame:CGRectMake(10, 385, self.view.frame.size.width, 25)];
    
    // 颜色和字体大小设置
    activityTitle.font                    = [UIFont systemFontOfSize:15];
    activityTitle.textColor               = [UIColor whiteColor];
    activityTime.font                     = [UIFont systemFontOfSize:12];
    activityTime.textColor                = [UIColor whiteColor];
    address.font                          = [UIFont systemFontOfSize:14];
    address.textColor                     = [UIColor whiteColor];
    userName.font                         = [UIFont systemFontOfSize:14];
    userName.textColor                    = [UIColor whiteColor];
    organizer.font                        = [UIFont systemFontOfSize:14];
    organizer.textColor                   = [UIColor whiteColor];
    signUpDeadLine.font                   = [UIFont systemFontOfSize:14];
    signUpDeadLine.textColor              = [UIColor whiteColor];
    activityType.font                     = [UIFont systemFontOfSize:14];
    activityType.textColor                = [UIColor whiteColor];
    isJoin.font                           = [UIFont systemFontOfSize:14];
    isJoin.textColor                      = [UIColor whiteColor];
    // 添加到页面
    [firstView addSubview:activityTitle];
    [firstView addSubview:activityTime];
    [firstView addSubview:titleImageUrl];
    [firstView addSubview:address];
    [firstView addSubview:userName];
    [firstView addSubview:organizer];
    [firstView addSubview:signUpDeadLine];
    [firstView addSubview:activityType];
    [firstView addSubview:isJoin];
    SYModelData *item                          = [[SYModelData alloc]init];
    item = [[[SYModel shareInstance] activityContentArray] objectAtIndex:0];
    activityTitle.text                    = item.activityTitle;
    activityTime.text                     = item.activityTime;
    [titleImageUrl setImageWithURL:[NSURL URLWithString:item.titleImageUrl]];
    address.text                          = item.address;
    userName.text                         = item.userName;
    organizer.text                        = item.organizer;
    signUpDeadLine.text                   = item.signUpDeadLine;
    activityType.text                     = item.activityType;
    isJoin.text                           = item.isJoin;
    // 内容页面
    UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
    UIWebView *contentText                = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    contentText.delegate                  = self;
    [contentText loadHTMLString:item.content baseURL:nil];
    [secondView addSubview:contentText];
    [_scrollView addSubview:firstView];
    [_scrollView addSubview:secondView];
    [self.view addSubview:_scrollView];
    UISwipeGestureRecognizer *leftFingers = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingersToright:)];
    [leftFingers setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    UISwipeGestureRecognizer *rightFingers = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingersToright:)];
    [rightFingers setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:rightFingers];
    [self.view addGestureRecognizer:leftFingers];
}

/**
 *  手指向左滑动的方法
 */
-(void)oneFingersToright:(UISwipeGestureRecognizer *)recognizer
{
    if(recognizer.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        CGPoint point             = _scrollView.contentOffset;
        point.x                   = self.view.frame.size.width;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        // 动画持续几秒
        [UIView setAnimationDuration:0.5];
        _scrollView.contentOffset = point;
        [UIView commitAnimations];
    }
    else if(recognizer.direction == UISwipeGestureRecognizerDirectionRight)
    {
        CGPoint point             = _scrollView.contentOffset;
        point.x                   = 0;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        // 动画持续几秒
        [UIView setAnimationDuration:0.2];
        _scrollView.contentOffset = point;
        [UIView commitAnimations];
    }
}

@end
