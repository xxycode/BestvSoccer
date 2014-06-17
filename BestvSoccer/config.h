//
//  config.h
//  BestvSoccer
//
//  Created by Apple on 14-6-16.
//  Copyright (c) 2014年 xxy. All rights reserved.
//

#ifndef BestvSoccer_config_h
#define BestvSoccer_config_h

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kVersion [UIDevice currentDevice].systemVersion.floatValue
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0] 
//#define BaseUrl @"http://10.61.1.241:8080/epl_oss"
#define BaseUrl @"http://mobileoss.bestv.cn"

//#define BaseOptaUrl @"http://10.61.1.250:8082/opta-server"
#define BaseOptaUrl @"http://mobileopta.bestv.cn"


#define OptaScheduleUrl0 [NSString stringWithFormat:@"%@%@", BaseOptaUrl, @"/optainfo?name=schedule"]

#define OptaScheduleUrl [NSString stringWithFormat:@"%@%@", BaseOptaUrl, @"/optainfo?name=schedule&matchday=%i"]

#define OptaMatchUrl [NSString stringWithFormat:@"%@%@", BaseOptaUrl, @"/optainfo?name=match&gameid=%@"]

#define OptaMatchStatUrl [NSString stringWithFormat:@"%@%@", BaseOptaUrl, @"/optainfo?name=match_stat&gameid=%@"]

#define OptaMatchLineupUrl [NSString stringWithFormat:@"%@%@", BaseOptaUrl, @"/optainfo?name=match_lineup&gameid=%@"]

#define OptaPlayerTopUrl [NSString stringWithFormat:@"%@%@", BaseOptaUrl, @"/optainfo?name=player_top&type=%@"]

#define OptaSeasonTableUrl [NSString stringWithFormat:@"%@%@", BaseOptaUrl, @"/optainfo?name=season_table"]


// 启动接口
#define IInitUrl    [NSString stringWithFormat:@"%@%@", BaseUrl, @"/init!start.action?tc=%@&ttc=%@&system=%@&platform=%@&channel=%@&pid=%@&action=%@&page=%@&version=%@&user=%@&aid=%@&mnc=%i"]

// bdid接口
#define IUpdateBdidUrl  [NSString stringWithFormat:@"%@%@", BaseUrl, @"/bdid!update.action?tc=%@&ttc=%@&system=%@&platform=%@&channel=%@&pid=%@&version=%@&user=%@&email=%@&token=%@&openudid=%@&adid=%@&mac=%@"]

// 版本检查
#define IVersionUrl    [NSString stringWithFormat:@"%@%@", BaseUrl, @"/version!check.action?tc=%@&ttc=%@&system=%@&platform=%@&channel=%@&pid=%@&action=%@&page=%@&version=%@&user=%@&aid=%@"]

// 反馈
#define IFeedBackUrl  [NSString stringWithFormat:@"%@%@", BaseUrl, @"/feedback.action?tc=%@&ttc=%@&system=%@&platform=%@&channel=%@&pid=%@&action=%@&page=%@&version=%@&user=%@&phone=%@&email=%@&network=%@"]

// 反馈查询
#define IFeedBackInfo  [NSString stringWithFormat:@"%@%@", BaseUrl, @"/backinfo.action?tc=%@&ttc=%@&system=%@&platform=%@&channel=%@&pid=%@&action=%@&page=%@&version=%@&user=%@&aid=%@"]

// 应用推荐
#define IAppInfo  [NSString stringWithFormat:@"%@%@", BaseUrl, @"/app.action?tc=%@&ttc=%@&system=%@&platform=%@&channel=%@&pid=%@&action=%@&page=%@&version=%@&user=%@&aid=%@"]

// tvurl
#define IGetTvUrl  [NSString stringWithFormat:@"%@%@", BaseUrl, @"/tv!geturl.action?tc=%@&ttc=%@&system=%@&platform=%@&channel=%@&pid=%@&action=%@&page=%@&version=%@&user=%@&aid=%@&uid=%@"]

#define IGetInfoUrl  @"%@&lastContId=%@&WD_UUID=%@&WD_UA=%@&WD_VERSION=%@&WD_CHANNELID=%@&WD_SYSTEM_VERSION=%@&WD_SIM=%@&WD_PRODUCT_TYPE=%@&WD_PHONE_NUMBER=&WD_NETWORK_TYPE=0&WD_CLIENT_TYPE=0&WD_OS_TYPE=2&WD_RESOLUTION=&userId=1718"

#define IMatchDetailUrl  @"%@&gameId=%@&lastId=%@&WD_UUID=%@&WD_UA=%@&WD_VERSION=%@&WD_CHANNELID=%@&WD_SYSTEM_VERSION=%@&WD_SIM=%@&WD_PRODUCT_TYPE=%@&WD_PHONE_NUMBER=&WD_NETWORK_TYPE=0&WD_CLIENT_TYPE=0&WD_OS_TYPE=2&WD_RESOLUTION=&userId=1718&t=1"
#endif
