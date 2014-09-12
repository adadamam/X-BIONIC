//
//  UserCenterViewController.m
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-9-5.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import "XBMainViewController.h"
#import "XBUserCenterViewController.h"
#import "SYModel.h"
#import "SYdefine.h"
#import "XBUserLoginViewController.h"

@interface XBUserLoginViewController ()
{
    UITextField *_userNameTextField;
    UITextField *_passwordTextField;
}

@end

@implementation XBUserLoginViewController

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
  
    [self initView];
    [self createTextField];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// TODO:-------登录输入框和按钮-------
/**
 *  创建textfield
 */
- (void)createTextField
{
    // 欢迎文字
    UILabel *welcomeTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 60, 300, 30)];
    welcomeTextLabel.text = @"无限增值服务应用，欢迎您！";
    welcomeTextLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:welcomeTextLabel];
    
    // 用户名输入框
    _userNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(70, 200, 220, 30)];
    _userNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    _userNameTextField.placeholder = @"用户名";
    _userNameTextField.backgroundColor = [UIColor clearColor];
    _userNameTextField.textColor = [UIColor whiteColor];
    _userNameTextField.clearButtonMode = UITextFieldViewModeAlways;
    _userNameTextField.delegate = self;
    [_userNameTextField resignFirstResponder];
    [_userNameTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    // 背景
    UIView *usernameBackGround = [[UIView alloc] initWithFrame:CGRectMake(20, 195, 280, 40)];
    [usernameBackGround setBackgroundColor:[UIColor whiteColor]];
    usernameBackGround.alpha = 0.2;
    [self.view addSubview:usernameBackGround];
    // 图标
    UIView *personPicture = [[UIView alloc] initWithFrame:CGRectMake(30, 201.5, 24, 27)];
    personPicture.alpha = 1;
    personPicture.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"personPicture"]];
    [self.view addSubview:personPicture];
    
    
    // 密码输入框
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(70, 250, 220, 30)];
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    _passwordTextField.placeholder = @"请输入密码";
    _passwordTextField.backgroundColor = [UIColor clearColor];
    _passwordTextField.textColor = [UIColor whiteColor];
    _passwordTextField.clearButtonMode = UITextFieldViewModeAlways;
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.delegate = self;
    [_passwordTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    // 背景
    UIView *passwordBackGround = [[UIView alloc] initWithFrame:CGRectMake(20, 245, 280, 40)];
    [passwordBackGround setBackgroundColor:[UIColor whiteColor]];
    passwordBackGround.alpha = 0.2;
    [self.view addSubview:passwordBackGround];
    // 图标
    UIView *passwordPicture = [[UIView alloc] initWithFrame:CGRectMake(32, 250, 16, 32)];
    passwordPicture.alpha = 1;
    passwordPicture.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"keyPicture"]];
    [self.view addSubview:passwordPicture];
    
    // 登录按钮
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 320, 300, 42)];
    [loginButton setBackgroundImage:[UIImage imageNamed:@"enterPicture"] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(clickLoginButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];

    [self.view addSubview:_userNameTextField];
    [self.view addSubview:_passwordTextField];
}

/**
 *  点击登录按钮
 */
- (void)clickLoginButton
{
    [self postUrl];
    XBMainViewController *mainVC = [[XBMainViewController alloc] init];
    [self.navigationController pushViewController:mainVC animated:YES];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
//                                             initWithImage:[UIImage imageNamed:@"listButton"]];
//                                             style:UIBarButtonItemStylePlain
//                                             target:self
//                                             action:@selector(clickListButton)];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"listButton"] style:UIBarButtonItemStylePlain target:nil action:nil];
//    XBUserCenterViewController *userCenterVC = [[XBUserCenterViewController alloc] init];
//    [self.navigationController pushViewController:userCenterVC animated:YES];

}

/**
 *  按return按钮把键盘退出屏幕
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_userNameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
    return YES;
}

// TODO:-------导航栏和背景-------
- (void)initView
{
//    UINavigationController 
    // 设置导航栏背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"topNav"]
                                                  forBarMetrics:UIBarMetricsDefault];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"logoutBtn"] style:UIBarButtonItemStylePlain target:self action:@selector(clickBackButton)];

    self.navigationItem.title = @"登录";
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [backgroundImageView setImage:[UIImage imageNamed:@"peopleBackground"]];
    [self.view addSubview:backgroundImageView];
}

/**
 *  点击返回按钮动作
 */
- (void)clickBackButton
{
//    [self.navigationController popViewControllerAnimated:NO];
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  POST请求
 */
- (void)postUrl
{
    [[SYModel shareInstance] postNSURL];
}
@end
