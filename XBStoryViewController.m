//
//  XBStoryViewController.m
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-9-3.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import "XBStoryTableViewCell.h"
#import "SYModel.h"
#import "SYdefine.h"
#import "XBStoryViewController.h"

@interface XBStoryViewController ()
{
    UITableView *_storyTableView; // 达人故事表格
}

@end

@implementation XBStoryViewController

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
    
    // 初始化导航栏
    [self initNavigation];
    
    // 初始化一个tableview
    [self initTableView];
    
    [[SYModel shareInstance] acquireStoryData];
    NSLog(@"jdidjijfijdifdi = %@", [[SYModel shareInstance] acquireStoryData]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  初始化导航栏
 */
- (void)initNavigation
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithImage:[UIImage imageNamed:@"backButtonPic"]
                                                     style:UIBarButtonItemStylePlain
                                                    target:self
                                                    action:@selector(clickBackButton)];
    
    UIImageView *titleImageView = [[UIImageView alloc] initWithFrame:LOCATION_OF_NAVIGATIONTITLE];
    titleImageView.contentMode = UIViewContentModeScaleAspectFill;
    [titleImageView setImage:[UIImage imageNamed:@"storytitle"]];
    self.navigationItem.titleView = titleImageView;
}

/**
 *  返回按钮的动作
 */
- (void)clickBackButton
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/**
 *  初始化一个tableview
 */
- (void)initTableView
{
    // 初始化tableview
    _storyTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                    0,
                                                                    self.view.frame.size.width,
                                                                    self.view.frame.size.height)
                                                   style:UITableViewStylePlain];
    // 设置委托
    _storyTableView.delegate   = self;
    _storyTableView.dataSource = self;
    [self.view addSubview:_storyTableView];
}

/**
 *  绘制cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"storyCellID";
    XBStoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[XBStoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                           reuseIdentifier:cellID];
    }
    return cell;
}
/**
 *  每个section里面有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

/**
 *  点击行的方法
 */
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

/**
 *  每行的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

/**
 *  section高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0f;
}
@end
