//
//  InterduceTableViewCell.m
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-9-1.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import "XBInterduceTableViewCell.h"

@implementation XBInterduceTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.introduceImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 101)];
        [self.contentView addSubview:self.introduceImageView];
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
