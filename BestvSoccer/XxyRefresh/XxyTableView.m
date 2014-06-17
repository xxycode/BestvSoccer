//
//  XxyTableView.m
//  SlimeRefresh
//
//  Created by Apple on 14-6-10.
//  Copyright (c) 2014年 zrz. All rights reserved.
//

#import "XxyTableView.h"


@implementation XxyTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        if(_dataArr == nil){
            _dataArr = [[NSMutableArray alloc] init];
        }
        _finishedLoadData = NO;
        [self loadRefreshView];
        
    }
    return self;
}


- (void)loadRefreshView
{
    slimeView = [[SRRefreshView alloc] init];
    slimeView.delegate = self;
    slimeView.upInset = 44;
    slimeView.slimeMissWhenGoingBack = YES;
    slimeView.slime.bodyColor = [UIColor orangeColor];
    slimeView.slime.skinColor = [UIColor clearColor];
    slimeView.slime.lineWith = 1;
    slimeView.slime.shadowBlur = 4;
    slimeView.slime.shadowColor = [UIColor blackColor];
    [self addSubview:slimeView];
}

- (void)loadMoreView
{
    if (_moreBtn) {
        
        _haveMore = YES;
        moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        moreButton.backgroundColor = [UIColor clearColor];
        moreButton.frame = CGRectMake(0, 0, 320, 40);
        moreButton.titleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        [moreButton setTitle:moreBtnNorTitle forState:UIControlStateNormal];
        //_moreButton.titleLabel.textColor = [UIColor blackColor];
        [moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [moreButton addTarget:self action:@selector(loadMoreAction) forControlEvents:UIControlEventTouchUpInside];
        moreActivityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        moreActivityView.frame = CGRectMake(80, 10, 20, 20);
        [moreActivityView stopAnimating];
        moreActivityView.tag = 500;
        [moreButton addSubview:moreActivityView];
        self.tableFooterView = moreButton;
        //[self.tableFooterView setHidden:YES];
    }
}

- (void)setRefreshViewColor:(UIColor *)refreshViewColor
{
    [slimeView.slime setBodyColor:refreshViewColor];
}
//完成刷新
- (void)fininshedRefresh
{
    [slimeView endRefresh];
}
//设置下拉加载更多是否可用 以及各个状态的标题
- (void)setMoreBtn:(BOOL)moreBtn normalTitle:(NSString *)norTit loadingTitle:(NSString *)loaTit noMoreTit:(NSString *)noTit
{
    _moreBtn = moreBtn;
    moreBtnNorTitle = norTit;
    moreBtnLoaTitle = loaTit;
    moreBtnNoTitle = norTit;
    [self loadMoreView];
    
}

//加载更多
- (void)loadMoreAction
{
    [moreActivityView startAnimating];
    [moreButton setTitle:moreBtnLoaTitle forState:UIControlStateNormal];
    _loBlock();
}
//完成加载更多
- (void)fininshedLoadMore
{
    if (!_moreBtn) {
        return;
    }
    if (!_haveMore) {
        [moreActivityView stopAnimating];
        [moreButton setTitle:moreBtnNoTitle forState:UIControlStateNormal];
        [moreButton setEnabled:NO];
    } else{
        [moreActivityView stopAnimating];
        [moreButton setTitle:moreBtnNorTitle forState:UIControlStateNormal];
    }
}

- (void)didScroll
{
    if (!_finishedLoadData) {
        //NSLog(@"还没加载完数据");
        return;
    }
    [slimeView scrollViewDidScroll];
}

- (void)didEndDraging:(UIScrollView *)scrollView
{
    if (!_finishedLoadData) {
        //NSLog(@"还没加载完数据");
        return;
    }
    [slimeView scrollViewDidEndDraging];
    //float offset = scrollView.contentOffset.y;
    //float contentHeight = scrollView.contentSize.height;
    //float delt = contentHeight - offset;
//    NSLog(@"off:%f",offset);
//    if (offset < -20) {
//        if (!_haveMore) {
//            return;
//        }
//        [self loadMoreAction];
//    }
}

#pragma mark - slimeRefresh delegate

- (void)slimeRefreshStartRefresh:(SRRefreshView *)refreshView
{
    _reBlock();
}

@end
