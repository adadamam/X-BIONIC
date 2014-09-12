//
//  XBProductBuyViewController.m
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-9-3.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import "XBProductTableViewCell.h"
#import "XBUserLoginViewController.h"
#import "XBUserCenterViewController.h"
#import "SYdefine.h"
#import "XBProductBuyViewController.h"

@interface XBProductBuyViewController ()
{
    UITableView *_productTableView;
}

@property (nonatomic, strong) UITableView *productTableView;

@end

@implementation XBProductBuyViewController

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
    [self initNavigationBar];
    
    // 创建表格
    [self initTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// TODO:-------导航栏-------
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
    [titleImageView setImage:[UIImage imageNamed:@"productbuytitlebutton"]];
    self.navigationItem.titleView = titleImageView;
}

/**
 *  点击左导航按钮动作
 */
- (void)clickButton
{
    [self.navigationController popToRootViewControllerAnimated:YES];
//    XBUserCenterViewController *userCenterVC = [[XBUserCenterViewController alloc] init];
//    [self.navigationController pushViewController:userCenterVC animated:YES];
}

/**
 *  表格
 */
- (void)initTableView
{
    _productTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                      0,
                                                                      self.view.frame.size.width,
                                                                      self.view.frame.size.height)
                                                     style:UITableViewStylePlain];
    _productTableView.delegate = self;
    _productTableView.dataSource = self;
    [self.view addSubview:_productTableView];
}

/**
 *  每个组有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

/**
 *  每行有多高
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.frame.size.height / 2;
}

/**
 *  绘制cell
 */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *imageArray = @[@"upBackground", @"downBackground"];
    NSString *cellID = @"cell";
    XBProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[XBProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.productImageView.image = [UIImage imageNamed:@"downBackground"];
    cell.productImageView.image = [UIImage imageNamed:imageArray[indexPath.row]];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    return cell;
    
}
@end
