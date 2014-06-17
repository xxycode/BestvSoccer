//
//  ScoreViewController.h
//  BestvSoccer
//
//  Created by Apple on 14-6-16.
//  Copyright (c) 2014年 xxy. All rights reserved.
//

#import "TabFirstViewController.h"
#import "XxyTableView.h"
#import "MBProgressHUD.h"


@interface ScoreViewController : TabFirstViewController<UITableViewDataSource,MBProgressHUDDelegate,UITableViewDelegate>
{
    MBProgressHUD *HUD;
    XxyTableView *rankTableView;
}

@end
