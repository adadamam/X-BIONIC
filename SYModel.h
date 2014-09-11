//
//  SYModel.h
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-9-2.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYModel : NSObject

+ (id)shareInstance;

/**
 *  用户登录
 */
-(void)postNSURL;
/**
 *  介绍
 */
// 获得介绍图片
- (NSString *)displayImage; // 根据点击得到具体页面的数据
- (void)loadImage:(NSInteger)indexpath; // 获得点击的行数

/**
 *  活动
 */
- (void)acquireActivityData; // 获得活动数据
- (NSMutableArray *)activityArray;
- (void)activityContent:(NSInteger)row;
- (NSArray *)activityContentArray;

/**
 *  故事
 */
- (NSString *)acquireStoryData; // 获得达人故事数据


@end

