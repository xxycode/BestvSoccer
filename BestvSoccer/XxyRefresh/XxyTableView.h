//
//  XxyTableView.h
//  SlimeRefresh
//
//  Created by Apple on 14-6-10.
//  Copyright (c) 2014年 zrz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRRefreshView.h"

typedef void (^RefreshBlock)(void);
typedef void (^LoadMoreBlock)(void);

@interface XxyTableView : UITableView<SRRefreshDelegate,UIScrollViewDelegate>
{
    SRRefreshView   *slimeView;
    UIButton *moreButton;
    UIActivityIndicatorView *moreActivityView;
    NSString *moreBtnNorTitle;
    NSString *moreBtnLoaTitle;
    NSString *moreBtnNoTitle;
}

@property (nonatomic, strong) RefreshBlock reBlock;
@property (nonatomic, strong) LoadMoreBlock loBlock;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, assign) BOOL moreBtn;
@property (nonatomic, assign) BOOL haveMore;
@property (nonatomic, assign) BOOL finishedLoadData;

- (void)setRefreshViewColor:(UIColor *)refreshViewColor;
- (void)didScroll;
- (void)didEndDraging:(UIScrollView *)scrollView;
- (void)fininshedRefresh;
- (void)fininshedLoadMore;
- (void)setMoreBtn:(BOOL)moreBtn normalTitle:(NSString *)norTit loadingTitle:(NSString *)loaTit noMoreTit:(NSString *)noTit;

@end
