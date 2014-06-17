//
//  MainViewController.m
//  BestvSoccer
//
//  Created by Apple on 14-6-16.
//  Copyright (c) 2014年 xxy. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    [self initTabBar];
    // Do any additional setup after loading the view.
}

- (void)initTabBar
{
    tabView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 50, kScreenWidth, 50)];
    [self.view addSubview:tabView];
    barItemArr = [[NSMutableArray alloc] init];
    CGFloat x = 0;
    for (int i = 0; i < 5; i++) {
        NSString *normalImage = [NSString stringWithFormat:@"tab_b%d.png",i+1];
        NSString *focusImage = [NSString stringWithFormat:@"tab_b%d_f.png",i+1];
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, 0, 64, 50)];
        x += 64;
        [button setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:focusImage] forState:UIControlStateHighlighted];
        if (i == 0) {
            [button setImage:[UIImage imageNamed:focusImage] forState:UIControlStateNormal];
        }
        [button setTag:i+100];
        [button addTarget:self action:@selector(buttonAct:) forControlEvents:UIControlEventTouchUpInside];
        [barItemArr addObject:button];
        [tabView addSubview:button];
    }
}

- (void)buttonAct:(UIButton *)button
{
    int n = button.tag - 100;
    [self setSelectedIndex:n];
    for (int i = 0; i < 5; i ++) {
        if (i == n) {
            continue;
        }
        UIButton *btn = (UIButton *)[tabView viewWithTag:i+100];
        NSString *normalImage = [NSString stringWithFormat:@"tab_b%d.png",i+1];
        [btn setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    }
    NSString *focusImage = [NSString stringWithFormat:@"tab_b%d_f.png",n+1];
    [button setImage:[UIImage imageNamed:focusImage] forState:UIControlStateNormal];
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
