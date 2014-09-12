//
//  XBUserCenterViewController.m
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-9-10.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import "SYdefine.h"
#import "XBUserCenterTableViewCell.h"
#import "XBUserCenterViewController.h"

@interface XBUserCenterViewController ()
{
}

@end

@implementation XBUserCenterViewController

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
    [self createTableView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  导航栏和状态栏
 */
- (void)initNavigationBar
{
    [self.navigationController setNavigationBarHidden:YES];
//    // 设置导航栏背景图片
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"topNav"]
//                                                  forBarMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    self.view.backgroundColor = [UIColor blackColor];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}

/**
 *  创建表格
 */
- (void)createTableView
{
    UITableView *userTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                               0,
                                                                               self.view.frame.size.width,
                                                                               self.view.frame.size.height)];
    userTableView.delegate = self;
    userTableView.dataSource = self;
    [self.view addSubview:userTableView];
}

/**
 *  每个section的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

/**
 *  绘制cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = USERCENTERARRAY;
    NSArray *imageArray = USERCENTERIMAGE_ARRAY;
    NSString *cellID = @"cell";
    XBUserCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[XBUserCenterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                reuseIdentifier:cellID];
    }
    cell.userLabel.text = array[indexPath.row];
    cell.userImage.image = [UIImage imageNamed:imageArray[indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

/**
 *  section_header高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return USERCENTER_HEIGHT_FOR_SECTION;
}

/**
 *  cell高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ((self.view.frame.size.height - USERCENTER_HEIGHT_FOR_SECTION) / 7);
}

/**
 *  绘制header
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
    headerView.backgroundColor = [UIColor redColor];
    return headerView;
}
@end
