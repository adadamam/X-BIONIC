//
//  XBAcitvityViewController.m
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-9-3.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import "XBActivityDetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "SYModel.h"
#import "SYModelData.h"
#import "MJRefresh.h"
#import "XBActivityTableViewCell.h"
#import "SYdefine.h"
#import "XBAcitvityViewController.h"

NSString *const MJTableViewCellIdentifier = @"activityCell";


@interface XBAcitvityViewController ()
{
    SYModelData *_item;
}

@end

@implementation XBAcitvityViewController

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
    
    [self initData]; // 获得数据
    [self initNavigationBar]; // 初始化导航栏
    [self createTableView]; // 创建tableview
    [self setupRefresh];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 导航栏
/**
 *  初始化导航栏
 */
- (void)initNavigationBar
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithImage:[UIImage imageNamed:@"backButtonPic"]
                                                     style:UIBarButtonItemStylePlain
                                                    target:self
                                                    action:@selector(clickButton)];

    UIImageView *titleImageView = [[UIImageView alloc] initWithFrame:LOCATION_OF_NAVIGATIONTITLE];
    titleImageView.contentMode = UIViewContentModeScaleAspectFill;
    UIImage *titleImage = [UIImage imageNamed:@"activitytitle"];
    [titleImageView setImage:titleImage];
    self.navigationItem.titleView = titleImageView;
}

/**
 *  点击左边导航按钮的动作
 */
- (void)clickButton
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - tableview
/**
 *  创建tableview
 */
- (void)createTableView
{
    self.activityTableView = [[UITableView alloc]
                              initWithFrame:ACTIVITY_TABLEVIEW
                              (self.view.frame.size.width,
                               self.view.frame.size.height - kNAVIGATION_HEIGHT)
                              style:UITableViewStylePlain];
    self.activityTableView.delegate = self;
    self.activityTableView.dataSource = self;
    [self.view addSubview:self.activityTableView];
    
}

/**
 *  每个section的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[SYModel shareInstance] activityArray] count];
}

/**
 *  绘制cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"activityCell";
    XBActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[XBActivityTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                              reuseIdentifier:cellID];
    }
    _item = [[[SYModel shareInstance] activityArray] objectAtIndex:indexPath.row];
    cell.activityTitle.text = _item.activityTitle;
    cell.activityTime.text = _item.activityTime;
    cell.activityType.image = [UIImage imageNamed:_item.activityStatusId];
    [cell.titleImageUrl setImageWithURL:[NSURL URLWithString:_item.titleImageUrl]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

/**
 *  行的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HEIGHT_FOR_ROW;
}

/**
 *  获得数据
 */
- (void)initData
{
    _item = [[SYModelData alloc] init];
    [[SYModel shareInstance] acquireActivityData];
    [self.activityTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:MJTableViewCellIdentifier];
    [self setupRefresh];
}

/**
 *  点击cell
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [[SYModel shareInstance] activityContent:indexPath.row];
    XBActivityDetailViewController *detailVC = [[XBActivityDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

#pragma mark - 上拉和下拉刷新
/**
 *  集成刷新控件
 */
- (void)setupRefresh
{
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [_activityTableView addFooterWithTarget:self action:@selector(footerRereshing)];
}

#pragma mark 开始进入刷新状态

- (void)footerRereshing
{
    [[SYModel shareInstance] acquireActivityData];
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [_activityTableView reloadData];
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [_activityTableView footerEndRefreshing];
    });
}

@end
