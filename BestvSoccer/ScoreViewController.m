//
//  ScoreViewController.m
//  BestvSoccer
//
//  Created by Apple on 14-6-16.
//  Copyright (c) 2014年 xxy. All rights reserved.
//

#import "ScoreViewController.h"
#import "XxyHttpRequest.h"
#import "MBSXMLReader.h"
#import "ScoreTableViewCell.h"

@interface ScoreViewController ()

@end

@implementation ScoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTopTitle:@"积分"];
    [self initViews];
    // Do any additional setup after loading the view.
}

- (void)initViews
{
    CGFloat navHeigh = kVersion >= 7.0? 20.0f:0.0f;
    rankTableView = [[XxyTableView alloc] initWithFrame:CGRectMake(0, navHeigh+25, kScreenWidth, kScreenHeight - 20 - 50 - 25)];
    [self.view addSubview:rankTableView];
    [rankTableView setMoreBtn:NO];
    [rankTableView setRefreshViewColor:UIColorFromRGB(0x5d6498)];
    [rankTableView setDelegate:self];
    [rankTableView setDataSource:self];
    [rankTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [rankTableView setBackgroundColor:[UIColor clearColor]];
    [rankTableView setContentSize:CGSizeMake(kScreenWidth, kScreenHeight - 20 - 50 - 25)];
    ScoreViewController *sV = self;
    [rankTableView setReBlock:^{
        [sV reAct];
    }];
    [self.view bringSubviewToFront:self.navImageView];
    UILabel *posLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 30, 25)];
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 80, 25)];
    UILabel *totalLabel = [[UILabel alloc] initWithFrame:CGRectMake(105, 0, 30, 25)];
    UILabel *matchTotalLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 0, 30, 25)];
    UILabel *winLabel = [[UILabel alloc] initWithFrame:CGRectMake(155, 0, 30, 25)];
    UILabel *drawLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 0, 30, 25)];
    UILabel *loseLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 0, 30, 25)];
    UILabel *inLabel = [[UILabel alloc] initWithFrame:CGRectMake(223, 0, 30, 25)];
    UILabel *outLabel = [[UILabel alloc] initWithFrame:CGRectMake(250, 0, 30, 25)];
    UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectMake(270, 0, 50, 25)];
    NSMutableArray *labelArr = [[NSMutableArray alloc] init];
    [labelArr addObjectsFromArray:@[posLabel,nameLabel,totalLabel,matchTotalLabel,winLabel,drawLabel,loseLabel,inLabel,outLabel,numLabel]];
    UIView *tableTitView = [[UIView alloc] initWithFrame:CGRectMake(0, navHeigh + 44, kScreenWidth, 25)];
    [tableTitView setBackgroundColor:UIColorFromRGB(0x5d6498)];
    NSArray *titArr = @[@"排名",@"球队",@"积分",@"场次",@"胜",@"平",@"负",@"进球",@"失球",@"净胜球"];
    for (int i = 0; i < [labelArr count]; i ++) {
        UILabel *label = [labelArr objectAtIndex:i];
        [label setFont:[UIFont systemFontOfSize:12.0f]];
        [label setTextColor:UIColorFromRGB(0xffffff)];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setText:[titArr objectAtIndex:i]];
        [tableTitView addSubview:label];
    }
    [self.view addSubview:tableTitView];
    [self loadTableData];
}

- (void)loadTableData
{
    UIButton *btn = (UIButton *)[self.view viewWithTag:101];
    if (btn != nil) {
        [btn removeFromSuperview];
    }
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
	[self.view addSubview:HUD];
    HUD.delegate = self;
    [HUD show:YES];
    HUD.labelText = @"正在加载";
    XxyHttpRequest *req = [[XxyHttpRequest alloc] init];
    [req setFinishBlock:^(NSData *data){
        [self finishLoadData:data];
    }];
    [req setFailedBlock:^(NSError *err){
        [self failedLoadData];
    }];
    [req setProgressBlock:^(float curr){
        
    }];
    [req startAsyncWithUrl:[NSURL URLWithString:@"http://mobileopta.bestv.cn/optainfo?name=season_table"]];
}

- (void)finishLoadData:(NSData *)data
{
    if (rankTableView.finishedLoadData) {
        [rankTableView fininshedRefresh];
    }
    NSError *err = nil;
    NSDictionary *resDic = [MBSXMLReader dictionaryForXMLData:data error:&err];
    NSDictionary *teams = [resDic objectForKey:@"teams"];
    NSMutableArray *team = [teams objectForKey:@"team"];
    [rankTableView setDataArr:team];
    [HUD hide:YES];
    [rankTableView setFinishedLoadData:YES];
    [rankTableView reloadData];
}

- (void)failedLoadData
{
    [HUD hide:YES];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
    [btn setTitle:@"加载失败，点击重试" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn setTag:101];
    [btn setCenter:rankTableView.center];
    [btn addTarget:self action:@selector(loadTableData) forControlEvents:UIControlEventTouchUpInside];
}

- (void)failedRefresh
{
    if (rankTableView.finishedLoadData) {
        [rankTableView fininshedRefresh];
    }
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"加载失败" message:@"加载失败请稍后再试" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
}

- (void)reAct
{
    XxyHttpRequest *req = [[XxyHttpRequest alloc] init];
    [req setFinishBlock:^(NSData *data){
        [self finishLoadData:data];
    }];
    [req setFailedBlock:^(NSError *err){
        [self failedRefresh];
    }];
    [req setProgressBlock:^(float curr){
        
    }];
    [req startAsyncWithUrl:[NSURL URLWithString:@"http://mobileopta.bestv.cn/optainfo?name=season_table"]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [rankTableView.dataArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    ScoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[ScoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    NSDictionary *dic = [rankTableView.dataArr objectAtIndex:indexPath.row];
    [cell setTeamDic:dic index:indexPath.row+1 cout:rankTableView.dataArr.count];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35.0f;
}

#pragma mark - scrollView delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [rankTableView didScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [rankTableView didEndDraging:scrollView];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
