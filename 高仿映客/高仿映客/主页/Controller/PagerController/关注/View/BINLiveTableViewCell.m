//
//  BINLiveTableViewCell.m
//  高仿映客
//
//  Created by 梦想 on 2016/11/14.
//  Copyright © 2016年 lin_tong. All rights reserved.
//

#import "BINLiveTableViewCell.h"

static NSString *cellId = @"cellId";

@interface BINLiveTableViewCell ()

@property (nonatomic, strong) UIImageView *iconI;
@property (nonatomic, strong) UILabel *nickL;
@property (nonatomic, strong) UILabel *cityL;
@property (nonatomic, strong) UILabel *online_usersL;
@property (nonatomic, strong) UIImageView *liveI;

@end

@implementation BINLiveTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

+ (BINLiveTableViewCell *)liveTableViewCellWithTableView:(UITableView *)tableView{
    BINLiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        
        cell = [[BINLiveTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        cell.iconI = [[UIImageView alloc] init];
        [cell addSubview:cell.iconI];
        cell.iconI.sd_layout.topSpaceToView(cell, 10)
                            .leftSpaceToView(cell, 10)
                            .widthIs(40)
                            .heightEqualToWidth();
        cell.iconI.layer.masksToBounds = YES;
        cell.iconI.layer.cornerRadius = 20;
        cell.iconI.layer.borderColor = [UIColor colorWithRed:0.58f green:0.44f blue:1.00f alpha:1.00f].CGColor;
        cell.iconI.layer.borderWidth = 2;
        
        
        cell.nickL = [[UILabel alloc] init];
        [cell addSubview:cell.nickL];
        cell.nickL.sd_layout.topEqualToView(cell.iconI)
                            .leftSpaceToView(cell.iconI, 3)
                            .heightIs(20)
                            .rightEqualToView(cell);
        cell.nickL.text = @"请叫我小辣椒";
        
        UIImageView *liveMap = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"live_map"] highlightedImage:[UIImage imageNamed:@"2.0_live_map"]];
        [cell addSubview:liveMap];
        liveMap.sd_layout.topSpaceToView(cell.nickL, 5)
                         .leftEqualToView(cell.nickL)
                         .heightIs(10)
                         .widthIs(10);
        
        cell.cityL = [[UILabel alloc] init];
        [cell addSubview:cell.cityL];
        cell.cityL.font = [UIFont systemFontOfSize:10];
        cell.cityL.sd_layout.topEqualToView(liveMap)
                            .leftSpaceToView(liveMap, 10)
                            .heightIs(5)
                            .widthIs(100);
        cell.cityL.text = @"北京市";
        
        UILabel *online = [[UILabel alloc] init];
        [cell addSubview:online];
        online.sd_layout.topSpaceToView(cell.nickL, 0)
                        .rightSpaceToView(cell, 5)
                        .widthIs(30)
                        .heightIs(30);
        online.font = [UIFont systemFontOfSize:10];
        online.text = @"在看";
        
        cell.online_usersL = [[UILabel alloc] init];
        [cell addSubview:cell.online_usersL];
        cell.online_usersL.textAlignment = NSTextAlignmentRight;
        cell.online_usersL.sd_layout.topSpaceToView(cell, 30)
                                    .rightSpaceToView(online, 5)
                                    .widthIs(200)
                                    .heightIs(30);
        cell.online_usersL.text = @"8888888";
        
        cell.liveI = [[UIImageView alloc] init];
        [cell addSubview:cell.liveI];
        cell.liveI.sd_layout.topSpaceToView(cell.iconI, 10)
                            .leftEqualToView(cell)
                            .heightEqualToWidth()
                            .rightEqualToView(cell);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    return cell;
}

- (void)setLiveModel:(BINLiveModel *)liveModel{
    _liveModel = liveModel;
    self.cityL.text = liveModel.city;
    self.online_usersL.text = [NSString stringWithFormat:@"%d", liveModel.online_users];
}

- (void)setAnchorModel:(BINAnchorModel *)anchorModel{
    _anchorModel = anchorModel;
    NSString *url = [NSString stringWithFormat:@"http://img.meelive.cn/%@",anchorModel.portrait];
    self.nickL.text = anchorModel.nick;
    [self.liveI sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"default_room.jpg"] options:SDWebImageCacheMemoryOnly];
    [self.iconI sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"default_room.jpg"] options:SDWebImageCacheMemoryOnly];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
