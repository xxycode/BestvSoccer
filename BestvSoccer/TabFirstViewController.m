//
//  TabFirstViewController.m
//  BestvSoccer
//
//  Created by Apple on 14-6-16.
//  Copyright (c) 2014年 xxy. All rights reserved.
//

#import "TabFirstViewController.h"

@interface TabFirstViewController ()

@end

@implementation TabFirstViewController

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
    [self initBackgroundImage];
    // Do any additional setup after loading the view.
}

- (void)initBackgroundImage
{
    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    if (kScreenHeight > 480) {
        [backgroundImage setImage:[UIImage imageNamed:@"View_Bg-568h.png"]];
    }else{
        [backgroundImage setImage:[UIImage imageNamed:@"View_Bg.png"]];
    }
    [self.view addSubview:backgroundImage];
    [self.view bringSubviewToFront:self.navImageView];
}

//- (void)viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:animated];
//    CATransition *transition = [CATransition animation];
//    [transition setDuration:0.35];
//    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    transition.subtype = kCATransitionFromRight;
//    [transition setType:@"oglFlip"];
//    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
//}

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
