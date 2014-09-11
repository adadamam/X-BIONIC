//
//  SYModel.m
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-9-2.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import "SYdefine.h"
#import "SYModelData.h"
#import "SYModel.h"

static SYModel *model = nil;

@interface SYModel ()
{
    NSMutableArray *_activityArray;
    NSInteger _offset;
    NSArray *_activityContentArray;
}

@property (nonatomic, assign) NSInteger introduceIndexPath;

@end

@implementation SYModel


/**
 *  单例模式
 */
+ (id)shareInstance
{
    if (!model) {
        model = [[SYModel alloc] init];
    }
    return model;
}

#pragma mark - 用户中心
/**
 *  用户登录
 */
- (void)userLogin
{
    
}

-(void)postNSURL
{
    NSError *error;
    
    NSURL *url = [NSURL URLWithString:@"http://bulo2bulo.com:8080/mobile/api//passport/login.do?"];
    
    //第二步，创建请求
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    [request setHTTPMethod:@"POST"];//设置请求方式为POST，默认为GET
    
    NSString *str = @"password=qq147523&client=0&device=It'sasimulator&phoneNumber=18259222380";//设置参数
    
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPBody:data];
    
    //第三步，连接服务器,获取数据
    
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    NSDictionary *userCenterDic = [NSJSONSerialization JSONObjectWithData:received
                                                                options:NSJSONReadingMutableLeaves
                                                                  error:nil];
    NSDictionary *dic = userCenterDic[@"data"];
    NSLog(@"%@", dic[@"userAddress"]);
}

#pragma mark - X的介绍
/**
 * 获得点击的是哪个页面，返回页面图片
 */
- (NSString *)displayImage
{
    switch (self.introduceIndexPath) {
        case 0:
            return @"histroytext";
            break;
        case 1:
            return @"awareingtext";
            break;
        case 2:
            return @"bionicprototypetext";
            break;
        case 3:
            return @"productbasetext";
            break;
        case 4:
            return @"designanddevelopemttext";
            break;
        default:
            return nil;
            break;
    }
}

/**
 *  获得点击的indexpath.row
 */
- (void)loadImage:(NSInteger)indexpath
{
    self.introduceIndexPath = indexpath;
}

#pragma mark - 活动
/**
 *  获得活动数据
 */
- (void)acquireActivityData
{
    // 初始化活动数组
    _activityArray = [[NSMutableArray alloc] initWithCapacity:8];
    // 获得网址，把网址存入url
    NSString *Url = [NSString stringWithFormat:ACTIVITY_URL,(long)_offset];
    // 错误处理
    NSError *error;
    // 获得网址
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:Url]];
    //
    NSData *responseData  = [NSURLConnection sendSynchronousRequest:request
                                                  returningResponse:nil
                                                              error:&error];
    //
    NSDictionary *activityDic = [NSJSONSerialization JSONObjectWithData:responseData
                                                                options:NSJSONReadingMutableLeaves
                                                                  error:&error];
    // 把字典里key为data的值存入array
    NSArray *array = activityDic[@"data"];
    
    // 如果刷新超出范围，跳出
    if (_offset > [activityDic[@"total"] intValue]) {
        return;
    }
    
    // 遍历
    for (int i = 0; i < [array count]; i++)
    {
        //
        NSDictionary *activityDataDic  = [array objectAtIndex:i];
        //
        SYModelData *item                   = [[SYModelData alloc] init];
        //
        item.activityTitle             = activityDataDic[@"title"];
        // 获得图片，存入字符串
        NSString *image                = [NSString stringWithFormat:ACTIVITY_IMAGE,
                                                                    activityDataDic[@"titleImageUrl"]];
        //
        item.titleImageUrl             = image;
        //
        item.total                     = activityDataDic[@"total"];
        
        // 时间的转换
        NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
        [dateformatter setDateFormat:@"MM/dd/yyyy"];
        NSString *beginTime            = activityDataDic[@"beginTime"];
        beginTime                      = [beginTime substringToIndex:10];
        NSString *endTime              = activityDataDic[@"endTime"];
        endTime                        = [endTime substringToIndex:10];
        NSDate *baginData              = [dateformatter dateFromString:beginTime];
        NSDate *endData                = [dateformatter dateFromString:endTime];
        [dateformatter setDateFormat:@"yyyy年MM月dd日"];
        endTime                        = [dateformatter stringFromDate:endData];
        beginTime                      = [dateformatter stringFromDate:baginData];
        
        //
        item.activityTime              = [NSString stringWithFormat:@"%@ - %@",beginTime,endTime];
        // 活动状态
        item.activityStatusId          = @"applyactivity";
        // 活动详情内容添加;
        item.address                   = [NSString stringWithFormat:@"地址: %@",activityDataDic[@"address"]];
        item.userName                  = [NSString stringWithFormat:@"发起者: %@",activityDataDic[@"userName"]];
        item.organizer                 = [NSString stringWithFormat:@"组织者: %@",activityDataDic[@"organizer"]];
        NSString *signUpDeadTime       = activityDataDic[@"signUpDeadTime"];
        signUpDeadTime                 = [beginTime substringToIndex:10];
        NSDate *signUpDeadData         = [dateformatter dateFromString:beginTime];
        [dateformatter setDateFormat:@"yyyy年MM月dd日"];
        signUpDeadTime                 = [dateformatter stringFromDate:signUpDeadData];
        item.signUpDeadLine            = [NSString stringWithFormat:@"报名结束时间: %@",signUpDeadTime];
        item.activityType              = [NSString stringWithFormat:@"类型: %@",activityDataDic[@"activityType"]];
        item.isJoin                    = [NSString stringWithFormat:@"%@人参加",activityDataDic[@"isJoin"]];
        item.content = [NSString stringWithFormat:@"<html><body bgcolor=\"#000000\"><style type=\"text/css\">p {color:white}</style><p>%@</p></body></html>",activityDataDic[@"content"]];
        [_activityArray addObject:item];
    }
    _offset = [_activityArray count];
}

/**
 *  返回数据
 */
- (NSMutableArray *)activityArray
{
    return _activityArray;
}

- (void)activityContent:(NSInteger)indexpath
{
    _activityContentArray = [NSArray arrayWithObjects:[_activityArray objectAtIndex:indexpath], nil];
}


- (NSArray *)activityContentArray
{
    return _activityContentArray;
}
#pragma mark - 达人故事
/**
 *  获取数据
 */
- (NSString *)acquireStoryData
{
//    // 定义一个错误信息
//    NSError *error;
//    // 获得网址
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://bulo2bulo.com:8080/mobile/api/testteam/list.do?offset=0"]];
//    // 从网址获得数据
//    NSData *reqponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
//    NSDictionary *storyDic = [NSJSONSerialization JSONObjectWithData:reqponseData options:NSJSONReadingMutableLeaves error:&error];
//    if (error) {
//        NSLog(@"出错了");
//        return nil;
//    }
//    // 把数据存入字典
//    NSMutableArray *storyInfo = [storyDic :@"data"];
//    NSString *str = [NSString stringWithFormat:@"%@  %@  %@  %@  %@", storyInfo[@"id"], storyInfo[@"createBy"], storyInfo[@"createDate"], storyInfo[@"currentStatus"], storyInfo[@"descrition"]];
//    NSLog(@"eeeeee = %@", str);
//    return str;
    return nil;
}

@end
