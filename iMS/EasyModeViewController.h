//
//  EasyModeViewController.h
//  iMS
//
//  Created by Chen Hsin Hsuan on 2014/11/16.
//  Copyright (c) 2014年 aircon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayMode.h"
@interface EasyModeViewController : PlayMode
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *clefNodeImage;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end
