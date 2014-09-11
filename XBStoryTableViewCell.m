//
//  XBStoryTableViewCell.m
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-9-3.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import "SYdefine.h"
#import "XBStoryTableViewCell.h"

@implementation XBStoryTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        UILabel *storyLabel = [[UILabel alloc] initWithFrame:LOCATION_OF_STORY_LABEL];
//        storyLabel.textAlignment = NSTextAlignmentNatural;
//        storyLabel.autoresizingMask = YES;
//        storyLabel.lineBreakMode = NSLineBreakByCharWrapping;
//        storyLabel.numberOfLines = 0;
//        [self.contentView addSubview:storyLabel];
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
