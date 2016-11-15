//
//  BINGZViewController.m
//  高仿映客
//
//  Created by 梦想 on 2016/11/14.
//  Copyright © 2016年 lin_tong. All rights reserved.
//

#import "BINGZViewController.h"
#import "BINLiveModel.h"
#import "BINAnchorModel.h"
#import "BINLiveTableViewCell.h"
#import "BINLiveRoomViewController.h"

@interface BINGZViewController ()<UITableViewDataSource, UITableViewDelegate>

/**
 房间数
 */
@property (nonatomic, strong) NSMutableArray *liveRooms;

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation BINGZViewController

- (NSMutableArray *)liveRooms{
    if (!_liveRooms) {
        _liveRooms = [NSMutableArray array];
    }
    return _liveRooms;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
    UITableView *tableView = [[UITableView alloc] init];
    self.tableView = tableView;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.rowHeight = 480;
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    tableView.frame = self.view.bounds;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getData];
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, screen_width, 30);
    label.backgroundColor = [UIColor purpleColor];
    label.text = @"  正在直播";
    label.textColor = [UIColor orangeColor];
    tableView.tableHeaderView = label;
    
    
}

#pragma mark----数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.liveRooms.count == 0) {
        return 5;
    }
    return self.liveRooms.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BINLiveTableViewCell *cell = [BINLiveTableViewCell liveTableViewCellWithTableView:tableView];
    if (self.liveRooms.count > 0) {
        cell.liveModel = self.liveRooms[indexPath.row];
        cell.anchorModel = [BINAnchorModel mj_objectWithKeyValues:cell.liveModel.creator];
    }
    return cell;
}

#pragma mark----代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BINLiveModel *model = self.liveRooms[indexPath.row];
    BINLiveRoomViewController *moive = [BINLiveRoomViewController movieViewControllerWithContentPath:model.stream_addr parameters:nil];
    [self presentViewController:moive animated:YES completion:nil];
    
}

#pragma mark----获取数据
- (void)getData{
    NSString *path = @"http://101.200.29.199/api/live/simpleall?cc=TG0001&conn=Wifi&cv=IK2.5.10_Iphone&devi=44d94653f9a0934cc94f12e542d7d363fae4256b&idfa=07506DA9-419B-460D-BAC8-E035DD6099BC&idfv=3D5EC291-4DDF-44FE-8AC7-B9598B532319&imei=&imsi=&lc=0000000000000014&multiaddr=1&osversion=ios_9.200000&proto=1&sid=EE3qPwpb4VuMR65ShMqfaS8i3&ua=iPhone%205s&uid=509195";
    
    [self get:path andPara:nil andHudStr:@"正在加载" succeed:^(NSURLSessionDataTask *task, id data) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@", [dict objectForKey:@"lives"][1]);
        if ([[dict objectForKey:@"error_msg"] isEqualToString:@"操作成功"]) {
            NSLog(@"live.city  %@", [dict objectForKey:@"lives"]);
            [self.liveRooms addObjectsFromArray:[BINLiveModel mj_objectArrayWithKeyValuesArray:[dict objectForKey:@"lives"]]];
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
        }
    } failed:^(NSURLSessionDataTask *task, NSError *error) {
        [self.tableView.mj_header endRefreshing];
        NSLog(@"error  %@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
