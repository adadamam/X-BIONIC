//
//  XBProductTableViewCell.m
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-9-5.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import "XBProductTableViewCell.h"

@implementation XBProductTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        // 表格图片视图
        self.productImageView = [[UIImageView alloc]
                                 initWithFrame:CGRectMake(0,
                                                          -1,
                                                          320,
                                                          254)];
        [self.contentView addSubview:self.productImageView];
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
