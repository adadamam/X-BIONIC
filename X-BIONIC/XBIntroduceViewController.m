//
//  IntroduceViewController.m
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-9-1.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import "XBDetailViewController.h"
#import "SYModel.h"
#import "XBInterduceTableViewCell.h"
#import "SYdefine.h"
#import "XBIntroduceViewController.h"

@interface XBIntroduceViewController ()
{
    UITableView *_introduceTableView; // x的介绍表格。
    NSMutableArray *_imageArray; // 图片数组。
}

@property(strong, nonatomic) UIImageView *introduceImageView;

@end

@implementation XBIntroduceViewController

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
    
    // 创建表格
    [self initTableView];
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
    // 设置返回按钮的背景图片和点击动作。
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithImage:[UIImage imageNamed:@"backButtonPic"]
                                                     style:UIBarButtonItemStylePlain
                                                    target:self
                                                    action:@selector(clickBackButton)];
    // 设置右边按钮的背景图片和点击动作。
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithImage:[UIImage imageNamed:@"searchBtnPic"]
                                                      style:UIBarButtonItemStylePlain
                                                     target:self
                                                     action:@selector(clickSearchButton)];
    // 初始化图片视图
    UIImageView *titleImageView = [[UIImageView alloc] initWithFrame:LOCATION_OF_NAVIGATIONTITLE];
    // 设置内容样式，通过保持长宽比让缩放的内容适应视图的大小，任何剩余区域的视图的界限是透明的
    titleImageView.contentMode = UIViewContentModeScaleAspectFill;
    // 设置导航栏标题图片
    UIImage *titleImage = [UIImage imageNamed:@"introductTittle"];
    // 把图片加入图片视图
    [titleImageView setImage:titleImage];
    // 把导航栏标题用图片代替
    self.navigationItem.titleView = titleImageView;
}

/**
 *  点击返回按钮动作
 */
- (void)clickBackButton
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/**
 *  点击搜索按钮
 */
- (void)clickSearchButton
{
    
}

#pragma mark - 表格tableview
/**
 *  创建表格
 */
- (void)initTableView
{
    // 初始化一个表格
    _introduceTableView = [[UITableView alloc] initWithFrame:
                           INTRODUCE_TABLEVIEW(self.view.frame.size.width,
                                               self.view.frame.size.height - kNAVIGATION_HEIGHT)
                                                       style:UITableViewStylePlain];

    // 设置委托
    _introduceTableView.delegate   = self;
    _introduceTableView.dataSource = self;
    // 去掉分割线
    _introduceTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
   
    // 初始化图片数组，把图片存入图片数组中
    _imageArray = [[NSMutableArray alloc] initWithCapacity:8];
    _imageArray = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"histroy"],
                                                   [UIImage imageNamed:@"awareimg"],
                                                   [UIImage imageNamed:@"bionicprototype"],
                                                   [UIImage imageNamed:@"productionbase"],
                                                   [UIImage imageNamed:@"designanddevelopemt"], nil];
    // 把表格加入视图中
    [self.view addSubview:_introduceTableView];
    
}

/**
 *  每个section有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_imageArray count];
}

/**
 *  行的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (self.view.bounds.size.height / 5.0f);
}

/**
 *  绘制cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"introduceCell";
    XBInterduceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[XBInterduceTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                               reuseIdentifier:cellID];
    }
    cell.introduceImageView.image = [_imageArray objectAtIndex:indexPath.row];
    return cell;
}

/**
 *  点击cell响应事件。
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XBDetailViewController *detailVC = [[XBDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
    switch (indexPath.row) {
        case 0:
            detailVC.navigationItem.title = @"品牌历史";
            break;
        case 1:
            detailVC.navigationItem.title = @"所获奖项";
            break;
        case 2:
            detailVC.navigationItem.title = @"仿生原型";
            break;
        case 3:
            detailVC.navigationItem.title = @"生产基地";
            break;
        case 4:
            detailVC.navigationItem.title = @"设计和研发";
            break;
        default:
            break;
    }
    [[SYModel shareInstance] loadImage:indexPath.row];
}
@end
