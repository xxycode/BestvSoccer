//
//  ScoreTableViewCell.m
//  BestvSoccer
//
//  Created by Apple on 14-6-17.
//  Copyright (c) 2014年 xxy. All rights reserved.
//

#import "ScoreTableViewCell.h"

@implementation ScoreTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self initViews];
    }
    return self;
}

- (void)initViews
{
    bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 35)];
    [self addSubview:bgView];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self setBackgroundColor:[UIColor clearColor]];
    posLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 20, 25)];
    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 5, 80, 25)];
    totalLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 5, 20, 25)];
    matchTotalLabel = [[UILabel alloc] initWithFrame:CGRectMake(135, 5, 20, 25)];
    winLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 5, 20, 25)];
    drawLabel = [[UILabel alloc] initWithFrame:CGRectMake(185, 5, 20, 25)];
    loseLabel = [[UILabel alloc] initWithFrame:CGRectMake(205, 5, 20, 25)];
    inLabel = [[UILabel alloc] initWithFrame:CGRectMake(223, 5, 30, 25)];
    outLabel = [[UILabel alloc] initWithFrame:CGRectMake(255, 5, 20, 25)];
    numLabel = [[UILabel alloc] initWithFrame:CGRectMake(280, 5, 30, 25)];
    labelArr = [[NSMutableArray alloc] init];
    [labelArr addObjectsFromArray:@[posLabel,nameLabel,totalLabel,matchTotalLabel,winLabel,drawLabel,loseLabel,inLabel,outLabel,numLabel]];
    for (int i = 0; i < [labelArr count]; i ++) {
        UILabel *label = [labelArr objectAtIndex:i];
        [label setFont:[UIFont systemFontOfSize:13.0f]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setBackgroundColor:[UIColor clearColor]];
    }
    [self addSubview:posLabel];
    [self addSubview:nameLabel];
    [self addSubview:totalLabel];
    [self addSubview:matchTotalLabel];
    [self addSubview:winLabel];
    [self addSubview:drawLabel];
    [self addSubview:loseLabel];
    [self addSubview:inLabel];
    [self addSubview:outLabel];
    [self addSubview:numLabel];
}

- (void)setTeamDic:(NSDictionary *)teamDic index:(NSInteger)index cout:(NSInteger)count
{
    [bgView setImage:[UIImage imageNamed:@"score_list.png"]];
    if (index%2 == 0) {
        [bgView setImage:[UIImage imageNamed:@"score_list2.png"]];
    }
    for (int i = 0; i < [labelArr count]; i++) {
        UILabel *label = [labelArr objectAtIndex:i];
        if (index <= 4) {
            [label setTextColor:UIColorFromRGB(0xff9c00)];
        }else if(index > count - 3){
            [label setTextColor:UIColorFromRGB(0x7183b7)];
        }else{
            [label setTextColor:UIColorFromRGB(0xccccfc)];
        }
    }
    [posLabel setText:[teamDic objectForKey:@"position"]];
    [nameLabel setText:[teamDic objectForKey:@"teamName"]];
    [totalLabel setText:[teamDic objectForKey:@"scoreTotal"]];
    [matchTotalLabel setText:[teamDic objectForKey:@"totalMatch"]];
    [winLabel setText:[teamDic objectForKey:@"scoreWin"]];
    [drawLabel setText:[teamDic objectForKey:@"scoreDraw"]];
    [loseLabel setText:[teamDic objectForKey:@"scoreLose"]];
    [inLabel setText:[teamDic objectForKey:@"scoreIn"]];
    [outLabel setText:[teamDic objectForKey:@"scoreOut"]];
    [numLabel setText:[teamDic objectForKey:@"scoreNum"]];
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
