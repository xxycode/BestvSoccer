//
//  BaseViewController.m
//  BestvSoccer
//
//  Created by Apple on 14-6-16.
//  Copyright (c) 2014年 xxy. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

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
    [self initNavBar];
    // Do any additional setup after loading the view.
}

- (void)initNavBar
{
    CGFloat navHeight = kVersion >= 7.0? 64:44;
    NSString *imageName = kVersion >= 7.0? @"Nav_bar_ios7.png":@"Nav_bar.png";
    CGFloat marginTopTitle = kVersion >= 7.0? 20.0:0.0;
    _navImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, navHeight)];
    [_navImageView setImage:[UIImage imageNamed:imageName]];
    [_navImageView setUserInteractionEnabled:YES];
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, marginTopTitle, 200, 40)];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setFont:[UIFont systemFontOfSize:20.0f]];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [self.view addSubview:_navImageView];
    [_navImageView addSubview:titleLabel];
}

- (void)setTopTitle:(NSString *)title
{
    [titleLabel setText:title];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
