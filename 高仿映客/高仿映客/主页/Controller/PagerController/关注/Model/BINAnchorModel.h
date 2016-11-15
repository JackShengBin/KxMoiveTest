//
//  BINAnchorModel.h
//  高仿映客
//
//  Created by 梦想 on 2016/11/14.
//  Copyright © 2016年 lin_tong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BINAnchorModel : NSObject

/**
 "creator" : {
 "gender" : 1,
 "id" : 4429917,
 "level" : 36,
 "nick" : "🇨🇳疯欧巴",
 "portrait" : "MTQ3ODk0OTY1MzcxNSM0ODkjanBn.jpg"
 },
 */

/**
 *  性别
 */
@property (nonatomic, assign) int gender;
/**
 *  主播id
 */
@property (nonatomic, assign) int id;
/**
 *  等级
 */
@property (nonatomic, assign) int level;
/**
 *  主播名
 */
@property (nonatomic, copy) NSString *nick;
/**
 *  缩略图
 */
@property (nonatomic, copy) NSString *portrait;

@end
