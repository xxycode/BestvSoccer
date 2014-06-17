//
//  ScoreTableViewCell.h
//  BestvSoccer
//
//  Created by Apple on 14-6-17.
//  Copyright (c) 2014年 xxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreTableViewCell : UITableViewCell
{
    UILabel *posLabel;
    UILabel *nameLabel;
    UILabel *totalLabel;
    UILabel *matchTotalLabel;
    UILabel *winLabel;
    UILabel *drawLabel;
    UILabel *loseLabel;
    UILabel *inLabel;
    UILabel *outLabel;
    UILabel *numLabel;
    NSMutableArray *labelArr;
    UIImageView *bgView;
}

- (void)setTeamDic:(NSDictionary *)teamDic index:(NSInteger)index cout:(NSInteger)count;

@end
