//
//  XBProductBuyViewController.m
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-9-3.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import "SYdefine.h"
#import "XBProductBuyViewController.h"

@interface XBProductBuyViewController ()
{
    
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
}

/**
 *  表格
 */
- (void)initTableView
{
    
}

/**
 *  每个组有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

/**
 *  绘制cell
 */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}
@end
