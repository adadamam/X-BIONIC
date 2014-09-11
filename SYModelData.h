//
//  SYModelData.h
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-9-4.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYModelData : NSObject
// 用户中心




// X得活动的属性
@property (nonatomic, strong) NSString *activityTitle;//标题
@property (nonatomic, strong) NSString *activityTime;//时间
@property (nonatomic, strong) NSString *titleImageUrl;//图片
@property (nonatomic, strong) NSString *activityStatusId;//状态
@property (nonatomic, strong) NSString *total;//一共活动数
@property (nonatomic, strong) NSString *address;//地址
@property (nonatomic, strong) NSString *userName;// 发起者
@property (nonatomic, strong) NSString *organizer;//组织者
@property (nonatomic, strong) NSString *signUpDeadLine;//报名截止日期
@property (nonatomic, strong) NSString *activityType ;//类型
@property (nonatomic, strong) NSString *isJoin;//参加人数
@property (nonatomic, strong) NSString *content;// 详情
// 达人故事的属性
@property (nonatomic, strong) NSString *testDate;// 日期
@property (nonatomic, strong) NSString *phoneUrl;//图片地址
@property (nonatomic, strong) NSString *simpleDescrition;//tabaleView中显示得部分内容
@property (nonatomic, strong) NSString *descrition;// 详细内容

@end
