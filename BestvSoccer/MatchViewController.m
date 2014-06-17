//
//  MatchViewController.m
//  BestvSoccer
//
//  Created by Apple on 14-6-16.
//  Copyright (c) 2014年 xxy. All rights reserved.
//

#import "MatchViewController.h"

@interface MatchViewController ()

@end

@implementation MatchViewController

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
    [self setTopTitle:@"百视通英超"];
    [self initViews];
    // Do any additional setup after loading the view.
}

- (void)initViews
{
    CGFloat marginTopMoreButton = kVersion >= 7.0? 20.0:0.0;
    UIButton *moreButton = [[UIButton alloc] initWithFrame:CGRectMake(270, marginTopMoreButton, 50, 44)];
    [moreButton setImage:[UIImage imageNamed:@"btn_more.png"] forState:UIControlStateNormal];
    [moreButton setImage:[UIImage imageNamed:@"btn_more_f.png"] forState:UIControlStateHighlighted];
    [moreButton addTarget:self action:@selector(moreAct) forControlEvents:UIControlEventTouchUpInside];
    [self.navImageView addSubview:moreButton];
    
}

- (void)moreAct
{
    
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
