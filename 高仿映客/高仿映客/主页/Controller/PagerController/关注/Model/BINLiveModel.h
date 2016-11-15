//
//  BINGZModel.h
//  高仿映客
//
//  Created by 梦想 on 2016/11/14.
//  Copyright © 2016年 lin_tong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BINAnchorModel.h"

@interface BINLiveModel : NSObject

/**
 {
     "city" : "海口市",
     "creator" : {
     "gender" : 1,
     "id" : 4429917,
     "level" : 36,
     "nick" : "🇨🇳疯欧巴",
     "portrait" : "MTQ3ODk0OTY1MzcxNSM0ODkjanBn.jpg"
     },
     "group" : 0,
     "id" : "1479088374069905",
     "link" : 0,
     "multi" : 0,
     "name" : "早晨",
     "online_users" : 18236,
     "optimal" : 0,
     "rotate" : 0,
     "share_addr" : "http://mlive6.inke.com/share/live.html?uid=4429917&liveid=1479088374069905&ctime=1479088374",
     "slot" : 4,
     "stream_addr" : "http://pull99.a8.com/live/1479088374069905.flv",
     "version" : 0
 },
 */
/**
 *  城市
 */
@property (nonatomic, copy) NSString *city;
/**
 *  在线人数
 */
@property (nonatomic, assign) int online_users;
/**
 *  直播流地址
 */
@property (nonatomic, copy) NSString *stream_addr;

@property (nonatomic, strong) BINAnchorModel *creator;

@end
