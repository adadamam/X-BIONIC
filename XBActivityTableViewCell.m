//
//  XBActivityTableViewCell.m
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-9-4.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import "XBActivityTableViewCell.h"

@implementation XBActivityTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        // 活动主题
        self.activityTitle           =[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 250, 25)];
        self.activityTitle.font      = [UIFont systemFontOfSize:15];
        self.activityTitle.textColor = [UIColor whiteColor];

        // 活动时间
        self.activityTime            = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, 250, 25)];

        // 题目图片网址
        self.titleImageUrl           = [[UIImageView alloc] initWithFrame:CGRectMake(10, 68, 300, 170)];

        // 活动时间
        self.activityTime.font       = [UIFont systemFontOfSize:12];
        self.activityTime.textColor  = [UIColor whiteColor];
        self.activityType            = [[UIImageView alloc] initWithFrame:CGRectMake(250, 12.5, 50, 20)];
        
        [self.contentView addSubview:self.activityType];
        [self.contentView addSubview:self.activityTitle];
        [self.contentView addSubview:self.activityTime];
        [self.contentView addSubview:self.titleImageUrl];
        [self.contentView setBackgroundColor:[UIColor blackColor]];

    
    
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
