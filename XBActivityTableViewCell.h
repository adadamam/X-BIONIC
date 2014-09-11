//
//  XBActivityTableViewCell.h
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-9-4.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XBActivityTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *activityTitle; // 活动主题
@property (nonatomic, strong) UILabel *activityTime; // 活动时间
@property (nonatomic, strong) UIImageView *titleImageUrl; // 活动主题图片网址
@property (nonatomic, strong) UIImageView *activityType; // 活动形式


@end
