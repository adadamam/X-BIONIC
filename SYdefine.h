//
//  define.h
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-8-28.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#ifndef X_BIONIC_define_h
#define X_BIONIC_define_h

/**
 *  首页
 */

#define kHOMEPAGE_SCROLL_NUM 4 // 首页ScrollView的图片数
#define kHOMEPAGE_SCROLL_HEIGHT 480 // ScrollView高度
#define kHOMEPAGE_SCROLL_WIDTH 320 // ScrollView宽度

// 导航栏高度
#define kNAVIGATION_HEIGHT 64

// 进入首页加载哪页(320-介绍，640-活动，960-购买，1280-达人故事)
#define kFIRST_PAGE 640

// 导航栏标题位置
#define LOCATION_OF_NAVIGATIONTITLE CGRectMake(0.0f, 0.0f, 100.0f, 40.0f)


/**
 *  介绍
 */
// tableview
#define INTRODUCE_TABLEVIEW(wid,hei) CGRectMake(0,\
                                                0,\
                                                wid,\
                                                hei)

/**
 *  活动
 */
// tableview框架大小
#define ACTIVITY_TABLEVIEW(wid,hei) CGRectMake(0,\
                                               0,\
                                               wid,\
                                               hei)
#define HEIGHT_FOR_ROW 260.0f


// 活动网址
#define ACTIVITY_URL @"http://bulo2bulo.com:8080/mobile/api/activity/list.do?type=2&fetchSize=10&offset=%li"
// 活动图片网址
#define ACTIVITY_IMAGE @"http://bulo2bulo.com%@.jpg"

/**
 *  购买
 */

/**
 *  故事
 */
// “达人故事”label位置
#define LOCATION_OF_STORY_LABEL CGRectMake(0, 0, 100, 30)

/**
 *  用户中心
 */
#define USERCENTERARRAY @[@"您的订购", @"账户设置", @"达人申请", @"部落社区", @"购物车", @"订阅信息", @"分享设置"];

#endif
