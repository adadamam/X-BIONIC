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
    
    [self createTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return 7;
}

/**
 *  绘制cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = USERCENTERARRAY;
    NSString *cellID = @"cell";
    XBUserCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[XBUserCenterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = array[indexPath.row];
    return cell;
}
@end
