//
//  UserCenterTableViewCell.m
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-9-10.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import "SYdefine.h"
#import "XBUserCenterTableViewCell.h"

@implementation XBUserCenterTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.userLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 100, 40)];
        [self.contentView addSubview:self.userLabel];
        
        self.userImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 15, 30, 30)];
        [self.contentView addSubview:self.userImage];
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
