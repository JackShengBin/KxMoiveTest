//
//  BINLiveTableViewCell.h
//  高仿映客
//
//  Created by 梦想 on 2016/11/14.
//  Copyright © 2016年 lin_tong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BINLiveModel.h"
#import "BINAnchorModel.h"
@interface BINLiveTableViewCell : UITableViewCell

@property (nonatomic, strong) BINLiveModel *liveModel;
@property (nonatomic, strong) BINAnchorModel *anchorModel;

+ (BINLiveTableViewCell *)liveTableViewCellWithTableView:(UITableView *)tableView;

@end
