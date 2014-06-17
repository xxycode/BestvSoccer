//
//  BaseViewController.h
//  BestvSoccer
//
//  Created by Apple on 14-6-16.
//  Copyright (c) 2014年 xxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
{
    UILabel *titleLabel;
}

@property (nonatomic, strong) UIImageView *navImageView;
- (void)setTopTitle:(NSString *)title;

@end
